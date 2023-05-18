import 'package:core_folders/app_lib.dart';

class PickImageVideoServiceImpl implements PickImageVideoService {

  final picker = serviceLocator<ImagePicker>();

  @override
  Future<XFile?> pickImageFromCamera() async {
     return await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Future<XFile?> pickImageFromGallery() async {
    return await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Future<List<XFile>?> pickMultiImage() async {
    return await picker.pickMultiImage();
  }

  @override
  Future<XFile?> pickVideo() async {
    return await picker.pickVideo(source: ImageSource.gallery);
  }
}