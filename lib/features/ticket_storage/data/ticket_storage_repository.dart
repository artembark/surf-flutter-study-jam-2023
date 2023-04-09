import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// репозиторий для хранения билетов
class TicketStorageRepositoryImpl {
  final SharedPreferences prefs;

  TicketStorageRepositoryImpl(this.prefs);

  Future<void> saveTicket(String ticketId, String ticket) async {
    await prefs.setString(ticketId, ticket);
    final currentList = getAllTickets();
    if (!currentList.contains(ticketId)) {
      currentList.add(ticketId);
    }
    await prefs.setStringList('all_tickets', currentList);
  }

  List<String> getAllTickets() {
    return prefs.getStringList('all_tickets') ?? [];
  }

  String? getTicket(String ticketId) {
    return prefs.getString(ticketId);
  }

  Future<bool> removeTicket(String ticketId) async {
    return await prefs.remove(ticketId);
  }
}
