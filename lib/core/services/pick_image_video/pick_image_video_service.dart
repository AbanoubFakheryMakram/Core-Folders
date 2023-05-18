import 'package:core_folders/app_lib.dart';

abstract class PickImageVideoService {
  Future<XFile?> pickImageFromGallery();
  Future<XFile?> pickImageFromCamera();
  Future<XFile?> pickVideo();
  Future<List<XFile>?> pickMultiImage();
}