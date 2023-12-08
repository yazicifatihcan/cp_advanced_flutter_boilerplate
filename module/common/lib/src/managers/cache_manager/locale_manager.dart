import 'package:shared_preferences/shared_preferences.dart';


class LocaleManager {

    LocaleManager._init();
    late final SharedPreferences _preferences;

    static final LocaleManager _instance = LocaleManager._init();

    static LocaleManager get instance => _instance;

    static Future<void> cacheInit([SharedPreferences? initValue]) async {
      instance._preferences = initValue ?? await SharedPreferences.getInstance();
    }

  Future<void> clearAll() async {
    await _preferences.clear();
  }

  Future<void> removeAt(String key) async {
    await _preferences.remove(key);
  }

  Future<void> setStringValue(String key, String value) async {
    await _preferences.setString(key, value);
  }

  Future<void> setStringListValue(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  Future<void> setIntValue(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  String? getStringValue(String key) => _preferences.getString(key);

  bool? getBoolValue(String key) => _preferences.getBool(key);

  int? getIntValue(String key) => _preferences.getInt(key);
}
