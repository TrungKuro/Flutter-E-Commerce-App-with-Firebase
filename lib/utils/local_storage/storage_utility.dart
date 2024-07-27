import 'package:get_storage/get_storage.dart';

/* ------------------------------------------------------------------------- */

class ELocalStorage {
  /* ----------------------------------------------------------------------- */

  late final GetStorage _storage;

  // Singleton Instance.
  static ELocalStorage? _instance;

  ELocalStorage._internal();

  factory ELocalStorage.instance() {
    _instance ??= ELocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = ELocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  /* ----------------------------------------------------------------------- */

  // Generic method to save data
  Future<void> writeData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to SAVE data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to READ data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to REMOVE data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // CLEAR all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }

  /* ----------------------------------------------------------------------- */
}
