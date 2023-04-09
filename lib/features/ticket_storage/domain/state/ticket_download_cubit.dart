import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/data/ticket_download_service_impl.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/data/ticket_storage_repository.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_download_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_entity.dart';

part 'ticket_download_state.dart';

part 'ticket_download_cubit.freezed.dart';

class TicketDownloadCubit extends Cubit<TicketDownloadState> {
  final String ticketId;
  final TicketDownloadServiceImpl ticketDownloadServiceImpl;
  final TicketStorageRepositoryImpl ticketStorageRepositoryImpl;
  late StreamSubscription _fileDownloadSubscription;

  TicketDownloadCubit(this.ticketId, this.ticketDownloadServiceImpl,
      this.ticketStorageRepositoryImpl)
      : super(const TicketDownloadState()) {
    _fileDownloadSubscription =
        ticketDownloadServiceImpl.ticketDownloadStream.listen((event) {
      emit(state.copyWith(
          ticketEntity: state.ticketEntity?.copyWith(
        maxSize: event.maxSize,
        loadedSize: event.downloadedSize,
      )));
    });
  }

  @override
  Future<void> close() async {
    await _fileDownloadSubscription.cancel();
    super.close();
  }

  void init() {
    final TicketEntity ticketEntity = TicketEntity.fromJson(
        jsonDecode(ticketStorageRepositoryImpl.getTicket(ticketId) ?? ''));
    emit(state.copyWith(ticketEntity: ticketEntity));
  }

  Future<void> downloadTicket() async {
    if (state.isLoading) {
      return;
    }
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    final TicketEntity? newTicketEntity =
        state.ticketEntity?.copyWith(status: TicketDownloadStatus.downloading);
    emit(state.copyWith(isLoading: true, ticketEntity: newTicketEntity));
    final TicketEntity? ticket = state.ticketEntity;
    final String filePath = '${appDocDirectory.path}/tickets/${ticket?.id}';
    if (ticket != null) {
      try {
        await ticketDownloadServiceImpl.downloadFile(
          url: ticket.url,
          savePath: filePath,
        );
        emit(state.copyWith(
            isLoading: false,
            ticketEntity: ticket.copyWith(
              filePath: filePath,
              status: TicketDownloadStatus.downloaded,
            )));
        //todo return
        ticketStorageRepositoryImpl.saveTicket(
            ticketId, jsonEncode(state.ticketEntity?.toJson()));
      } catch (_) {
        emit(state.copyWith(
            isLoading: false,
            ticketEntity: ticket.copyWith(
              status: TicketDownloadStatus.error,
            )));
      }
    }
  }
}
