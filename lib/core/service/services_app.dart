import 'package:bookia/core/class/api_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesApp {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await ApiConnect.init();
  }
}
