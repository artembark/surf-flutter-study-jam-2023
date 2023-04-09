part of 'ticket_storage_cubit.dart';

@freezed
class TicketStorageState with _$TicketStorageState {
  const factory TicketStorageState({
    @Default([]) List<String> tickets,
  }) = _TicketStorageState;
}
