import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_study_jam_2023/app/shared_preferences.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/data/ticket_download_service_impl.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/data/ticket_storage_repository.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_download_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_type.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/state/ticket_download_cubit.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/state/ticket_storage_cubit.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/presentation/screens/pdf_view_screen.dart';

/// Экран “Хранения билетов”.
class TicketStoragePage extends StatefulWidget {
  const TicketStoragePage({Key? key}) : super(key: key);

  @override
  State<TicketStoragePage> createState() => _TicketStoragePageState();
}

class _TicketStoragePageState extends State<TicketStoragePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TicketStorageCubit(TicketStorageRepositoryImpl(SharedPrefs.instance))
        ..loadTickets(),
      child: const TicketStoragePageView(),
    );
  }
}

class TicketStoragePageView extends StatefulWidget {
  const TicketStoragePageView({Key? key}) : super(key: key);

  @override
  State<TicketStoragePageView> createState() => _TicketStoragePageViewState();
}

class _TicketStoragePageViewState extends State<TicketStoragePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хранение билетов'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TicketStorageCubit, TicketStorageState>(
          builder: (context, state) {
            if (state.tickets.isEmpty) {
              return const Center(
                child: Text(
                  'Здесь пока ничего нет',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.separated(
              itemCount: state.tickets.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(
                height: 16,
              ),
              itemBuilder: (BuildContext context, int index) {
                final String currentTicket = state.tickets[index];

                return Dismissible(
                  key: Key(currentTicket),
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      context
                          .read<TicketStorageCubit>()
                          .removeTicket(currentTicket);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Билет удален')));
                  },
                  child: BlocProvider(
                    create: (context) =>
                    TicketDownloadCubit(
                        currentTicket,
                        TicketDownloadServiceImpl(),
                        TicketStorageRepositoryImpl(SharedPrefs.instance))
                      ..init(),
                    child:
                    BlocBuilder<TicketDownloadCubit, TicketDownloadState>(
                      builder: (context, state) {
                        final int loadedSize =
                            state.ticketEntity?.loadedSize ?? 0;
                        final int? maxSize = state.ticketEntity?.maxSize;
                        final double currentProgress =
                        maxSize != null ? loadedSize / maxSize : 0;
                        return Row(
                          children: [
                            Icon(
                              _ticketTypeToIconData(
                                state.ticketEntity?.type,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  final String? filePath =
                                      state.ticketEntity?.filePath;
                                  final String? fileName =
                                      state.ticketEntity?.fileName;
                                  if (filePath != null && filePath.isNotEmpty) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) =>
                                            PdfViewScreen(
                                              filePath: filePath,
                                              fileName: fileName,
                                            )));
                                  }
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.ticketEntity?.fileName ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme
                                              .of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    LinearProgressIndicator(
                                      value: state.ticketEntity?.status ==
                                          TicketDownloadStatus.downloaded
                                          ? 1
                                          : currentProgress,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                        '${state.ticketEntity?.status
                                            .name}${_processLabel(
                                            loadedSize, maxSize)}')
                                  ],
                                ),
                              ),
                            ),

                            // Checkbox(
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(5)),
                            //     value: false,
                            //     onChanged: (value) {})
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: GestureDetector(
                                onTap: () =>
                                    context
                                        .read<TicketDownloadCubit>()
                                        .downloadTicket(),
                                child: Icon(
                                  _ticketDownloadStatusToIconData(
                                      state.ticketEntity?.status),
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .primary,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            _showTicketAddModal(
              context: context,
              onAdd: (url) =>
                  context.read<TicketStorageCubit>().addTicket(url: url),
            ),
        label: const Text('Добавить'),
      ),
    );
  }

  _showTicketAddModal(
      {required BuildContext context, required Function(String text) onAdd}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) =>
            _AddUrlBottomSheet(
              onAdd: onAdd,
            ));
  }

  /// статус загрузки в иконку
  IconData _ticketDownloadStatusToIconData(TicketDownloadStatus? status) {
    switch (status) {
      case TicketDownloadStatus.readyToDownload:
        return Icons.cloud_download;
      case TicketDownloadStatus.downloading:
        return Icons.pause_circle_filled_sharp;
      case TicketDownloadStatus.paused:
        return Icons.pause_circle_filled_sharp;
      case TicketDownloadStatus.downloaded:
        return Icons.cloud_done;
      case TicketDownloadStatus.error:
        return Icons.error;
      case null:
        return Icons.error;
    }
  }

  /// тип иконки в икнонку
  IconData _ticketTypeToIconData(TicketType? type) {
    switch (type) {
      case TicketType.train:
        return Icons.train;
      case TicketType.bus:
        return Icons.directions_bus;
      case TicketType.plane:
        return Icons.airplane_ticket;
      case TicketType.museum:
        return Icons.museum;
      case TicketType.undefined:
        return Icons.document_scanner;
      case null:
        return Icons.document_scanner;
    }
  }

  /// форматрирование прогресса загрузки в строку
  String _processLabel(int loaded, int? max) {
    if (max == null) return '';
    final String loadedText = _getFileSizeString(bytes: loaded, decimals: 1);
    final String maxText = _getFileSizeString(bytes: max, decimals: 1);
    return ' $loadedText из $maxText';
  }

  /// форматирование количества байт
  String _getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["б", "КБ", "МБ", "ГБ", "ТБ"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}

/// Содержимое модального окна добавления url
class _AddUrlBottomSheet extends StatefulWidget {
  const _AddUrlBottomSheet({Key? key, required this.onAdd}) : super(key: key);
  final Function(String text) onAdd;

  @override
  State<_AddUrlBottomSheet> createState() => _AddUrlBottomSheetState();
}

class _AddUrlBottomSheetState extends State<_AddUrlBottomSheet> {
  TextEditingController urlController = TextEditingController();
  String? urlErrorText;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      /// если буфер содержит что-то с pdf - вставляем
      final ClipboardData? clipboardData =
      await Clipboard.getData('text/plain');
      final String? clipboardText = clipboardData?.text;
      if (clipboardText != null && clipboardText.contains('.pdf') == true) {
        urlController.text = clipboardText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery
          .of(context)
          .viewInsets
          .bottom),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50.0,
              height: 5.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: urlController,
              onChanged: (string) {
                if (string.isNotEmpty) {
                  setState(() {
                    urlErrorText = null;
                  });
                }
              },
              decoration: InputDecoration(
                  errorText: urlErrorText,
                  label: const Text('Введите Url'),
                  helperText: '',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: TicketType.values.map((type) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(label: Text(type.name)),
                  )).toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  final urlString = urlController.text;
                  String? errorText;
                  if (urlString.isEmpty) {
                    errorText = 'Заполните поле';
                  } else if (!urlString.contains('pdf')) {
                    errorText = 'Введите корректный URL';
                  } else {
                    widget.onAdd(urlString);
                    Navigator.of(context).pop();
                  }
                  setState(() {
                    urlErrorText = errorText;
                  });
                },
                child: const Text('Добавить'))
          ],
        ),
      ),
    );
  }
}
