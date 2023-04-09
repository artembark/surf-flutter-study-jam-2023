import 'package:shared_preferences/shared_preferences.dart';

/// синглтон хранилища
class SharedPrefs {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();
}
