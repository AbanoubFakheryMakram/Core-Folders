import 'package:core_folders/app_lib.dart';

class EncryptionServiceImpl implements EncryptionService {

  @override
  String decrypt(String key, String encrypted) {
    return Encryptor.decrypt(key, encrypted);
  }

  @override
  String encrypt(String key, String value) {
    return Encryptor.encrypt(key, value);
  }
}