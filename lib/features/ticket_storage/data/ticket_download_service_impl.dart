import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_download_process_entity.dart';

class TicketDownloadServiceImpl {
  final _ticketDownloadController =
      StreamController<TicketDownloadProcessEntity>.broadcast();

  Stream get ticketDownloadStream => _ticketDownloadController.stream;

  Future<void> downloadFile(
      {required String url,
      required String savePath,
      CancelToken? cancelToken}) async {
    await downloadWithChunks(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          _ticketDownloadController
              .add(TicketDownloadProcessEntity(received, total));
        }
      },
      cancelToken: cancelToken,
    );
  }

  /// Downloading by spiting as file in chunks
  Future downloadWithChunks(
    url,
    savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    const firstChunkSize = 102;
    const maxChunk = 3;

    int total = 0;
    final dio = Dio();
    final progress = <int>[];

    void Function(int, int) createCallback(no) {
      return (int received, int _) {
        progress[no] = received;
        if (onReceiveProgress != null && total != 0) {
          onReceiveProgress(progress.reduce((a, b) => a + b), total);
        }
      };
    }

    Future<Response> downloadChunk(url, start, end, no,
        {CancelToken? cancelToken}) async {
      progress.add(0);
      --end;
      return dio.download(url, savePath + 'temp$no',
          onReceiveProgress: createCallback(no),
          options: Options(
            headers: {'range': 'bytes=$start-$end'},
          ),
          cancelToken: cancelToken);
    }

    Future mergeTempFiles(chunk) async {
      final f = File(savePath + 'temp0');
      final ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
      for (int i = 1; i < chunk; ++i) {
        final file = File(savePath + 'temp$i');
        await ioSink.addStream(file.openRead());
        await file.delete();
      }
      await ioSink.close();
      await f.rename(savePath);
    }

    final response = await downloadChunk(url, 0, firstChunkSize, 0);
    if (response.statusCode == 206) {
      total = int.parse(
        response.headers.value(HttpHeaders.contentRangeHeader)!.split('/').last,
      );
      final reserved = total -
          int.parse(response.headers.value(Headers.contentLengthHeader)!);
      int chunk = (reserved / firstChunkSize).ceil() + 1;
      if (chunk > 1) {
        int chunkSize = firstChunkSize;
        if (chunk > maxChunk + 1) {
          chunk = maxChunk + 1;
          chunkSize = (reserved / maxChunk).ceil();
        }
        final futures = <Future>[];
        for (int i = 0; i < maxChunk; ++i) {
          final start = firstChunkSize + i * chunkSize;
          futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
        }
        await Future.wait(futures);
      }
      await mergeTempFiles(chunk);
    }
  }
}
