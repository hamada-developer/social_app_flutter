import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    return await _sharedPreferences.setString(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return _sharedPreferences.get(key);
  }
}
