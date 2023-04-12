import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static String loginKey = "islogin";
  static late SharedPreferences sharedPreferences;

  //Here The Initialize of cache .
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setBool({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  static Future<bool> getBool({required String key}) async {
    return sharedPreferences.getBool(key) ?? false;
  }
}
