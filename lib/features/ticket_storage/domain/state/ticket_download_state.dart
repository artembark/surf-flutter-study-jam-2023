part of 'ticket_download_cubit.dart';

@freezed
class TicketDownloadState with _$TicketDownloadState {
  const factory TicketDownloadState({
    @Default(false) bool isLoading,
    TicketEntity? ticketEntity,
    CancelToken? cancelToken,
  }) = _TicketDownloadState;
}
