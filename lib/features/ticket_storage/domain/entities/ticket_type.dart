/// тип билета
enum TicketType {
  train('Поезд'),
  bus('Aвтобус'),
  plane('Самолет'),
  museum('Музей'),
  undefined('Другое');

  final String name;

  const TicketType(this.name);
}
