import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/app/shared_preferences.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/presentation/screens/ticket_storage_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Хранение билетов',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TicketStoragePage(),
    );
  }
}
