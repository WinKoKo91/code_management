import 'package:flutter_getx_template/app/data/local/get_storage/get_storage_manager.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageManagerImpl extends GetStorageManager {
  final _storage = GetStorage();

  @override
  Future<void> clear() {
    return _storage.erase();
  }

  @override
  Future<bool> getBool(String key, {bool defaultValue = false}) {
    return _storage.read(key);
  }

  @override
  Future<double> getDouble(String key, {double defaultValue = 0.0}) {
    throw _storage.read(key) ?? defaultValue;
  }

  @override
  Future<int> getInt(String key, {int defaultValue = 0}) {
    // TODO: implement getInt
    throw _storage.read(key) ?? defaultValue;
  }

  @override
  Future<String> getString(String key, {String defaultValue = ""}) {
    // TODO: implement getString
    throw _storage.read(key) ?? defaultValue;
  }

  @override
  Future<void> remove(String key) {
    return _storage.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) {
    return _storage.write(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) {
    return _storage.write(key, value);
  }

  @override
  Future<void> setInt(String key, int value) {
    return _storage.write(key, value);
  }

  @override
  Future<void> setString(String key, String value) {
    return _storage.write(key, value);
  }
}
