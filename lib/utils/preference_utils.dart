import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// shared_preferences 管理类
class PreferenceUtils {
  static PreferenceUtils? _instance;

  static PreferenceUtils get instance => PreferenceUtils();

  PreferenceUtils._internal();

  factory PreferenceUtils() {
    _instance ??= PreferenceUtils._internal();
    return _instance!;
  }

  putInteger(String key, int value) =>
      Get.find<SharedPreferences>().setInt(key, value);

  putString(String key, String value) =>
      Get.find<SharedPreferences>().setString(key, value);

  putBool(String key, bool value) =>
      Get.find<SharedPreferences>().setBool(key, value);

  putDouble(String key, double value) =>
      Get.find<SharedPreferences>().setDouble(key, value);

  putStringList(String key, List<String> value) =>
      Get.find<SharedPreferences>().setStringList(key, value);

  int getInteger(String key, [int defaultValue = 0]) {
    var value = Get.find<SharedPreferences>().getInt(key);
    return value ?? defaultValue;
  }

  String getString(String key, [String defaultValue = '']) {
    var value = Get.find<SharedPreferences>().getString(key);
    return value ?? defaultValue;
  }

  bool getBool(String key, [bool defaultValue = false]) {
    var value = Get.find<SharedPreferences>().getBool(key);
    return value ?? defaultValue;
  }

  double getDouble(String key, [double defaultValue = 0.0]) {
    var value = Get.find<SharedPreferences>().getDouble(key);
    return value ?? defaultValue;
  }

  List<String> getStringList(String key,
      [List<String> defaultValue = const <String>[]]) {
    var value = Get.find<SharedPreferences>().getStringList(key);
    return value ?? defaultValue;
  }

  void clear() {
    Get.find<SharedPreferences>().clear();
  }
}
