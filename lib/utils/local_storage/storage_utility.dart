import 'package:get_storage/get_storage.dart';

/* ------------------------------------------------------------------------- */

class ELocalStorage {
  /* ----------------------------------------------------------------------- */

  static final ELocalStorage _instance = ELocalStorage._internal();

  factory ELocalStorage() {
    return _instance;
  }

  ELocalStorage._internal();

  /* ----------------------------------------------------------------------- */

  //! Sử dụng gói "get_storage"
  final _storage = GetStorage();

  /* ----------------------------------------------------------------------- */

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
