/// состояние загрузки с текстовым значением
enum TicketDownloadStatus {
  readyToDownload('Ожидает начала загрузки'),
  downloading('Загружается'),
  paused('Загрузка приостановлена'),
  downloaded('Файл загружен'),
  error('Ошибка загрузки');

  final String name;

  const TicketDownloadStatus(this.name);
}
