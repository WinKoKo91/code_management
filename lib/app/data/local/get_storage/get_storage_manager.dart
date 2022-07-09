abstract class GetStorageManager{
  static const keyToken = "token";

  Future<String> getString(String key, {String defaultValue = ""});

  Future<void> setString(String key, String value);

  Future<int> getInt(String key, {int defaultValue = 0});

  Future<void> setInt(String key, int value);

  Future<double> getDouble(String key, {double defaultValue = 0.0});

  Future<void> setDouble(String key, double value);

  Future<bool> getBool(String key, {bool defaultValue = false});

  Future<void> setBool(String key, bool value);

/*  Future<List<String>> getStringList(String key,
      {List<String> defaultValue = const []});

  Future<void> setStringList(String key, List<String> value);*/

  Future<void> remove(String key);

  Future<void> clear();
}