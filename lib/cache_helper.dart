import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBooleanAppMode({
    required String key,
    required bool isDark,
  }) async{
    return await sharedPreferences!.setBool(key, isDark);
  }

  static bool? getBooleanAppMode({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }

}