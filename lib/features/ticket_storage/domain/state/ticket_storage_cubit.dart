import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/data/ticket_storage_repository.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_download_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_entity.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_type.dart';
import 'package:uuid/uuid.dart';

part 'ticket_storage_state.dart';

part 'ticket_storage_cubit.freezed.dart';

class TicketStorageCubit extends Cubit<TicketStorageState> {
  TicketStorageCubit(this.ticketStorageRepositoryImpl)
      : super(const TicketStorageState());

  final TicketStorageRepositoryImpl ticketStorageRepositoryImpl;

  void loadTickets() {
    final List<String> tickets = ticketStorageRepositoryImpl.getAllTickets();
    emit(state.copyWith(tickets: tickets));
  }

  void addTicket({
    required String url,
    TicketType? type,
  }) async {
    final TicketEntity newTicket = TicketEntity(
      id: const Uuid().v4(),
      createdAt: DateTime.now(),
      fileName: url.split('/').last.replaceAll('.pdf', ''),
      status: TicketDownloadStatus.readyToDownload,
      type: type ?? TicketType.undefined,
      url: url,
    );
    await ticketStorageRepositoryImpl.saveTicket(
        newTicket.id, jsonEncode(newTicket.toJson()));
    loadTickets();
  }

  void removeTicket(String id) async {
    await ticketStorageRepositoryImpl.removeTicket(id);
    loadTickets();
  }

  void downloadAll(){

  }
}
