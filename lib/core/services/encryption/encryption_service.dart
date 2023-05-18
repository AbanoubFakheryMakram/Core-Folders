
abstract class EncryptionService {
  String encrypt(String key, String value);
  String decrypt(String key, String encrypted);
}