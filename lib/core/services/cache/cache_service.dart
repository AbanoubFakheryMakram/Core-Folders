import 'package:core_folders/app_lib.dart';

class CacheService {

  final FlutterSecureStorage storage;
  final SharedPreferences sharedPreferences;

  CacheService(this.storage, this.sharedPreferences);

  void setTheme(String themeName) {
    storage.write(key: StorageKeys.theme, value: themeName);
  }

  Future<String?> getTheme() async {
    return await storage.read(key: StorageKeys.theme);
  }

  void setLanguage(String langCode) {
    storage.write(key: StorageKeys.language, value: langCode);
  }

  Future<String?> getLanguage() async {
    return await storage.read(key: StorageKeys.language);
  }

  Future<void> saveToken(String encryptedToken) async {
    await storage.write(key: StorageKeys.token, value: encryptedToken);
  }

  Future<String?> getToken() async {
    return await storage.read(key: StorageKeys.token);
  }

  void saveUserCredential(String value) {
    storage.write(key: StorageKeys.userCredentialKey, value: value);
  }

  Future<String?> getUserCredential() async {
    return await storage.read(key: StorageKeys.userCredentialKey);
  }

  // specially for IOS
  Future<void> clearCachedDataIfIsFirstTimeLaunch() async {
    if ((sharedPreferences.getBool(StorageKeys.firstTimeLaunch)) ?? true) {
      await storage.deleteAll();
      sharedPreferences.setBool(StorageKeys.firstTimeLaunch, false);
    }
  }

  Future<void> clearData(List<String> keys) async {
    for (var key in keys) {
      storage.delete(key: key);
    }
  }
}
