import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const open_first_getStarted ="openGetStarted";
  static const open_first_agree ="openAgree";
}


class SharePref {
  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<void> remove(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> clear()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}



