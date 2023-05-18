import 'package:core_folders/app_lib.dart';

extension FilesExtension on File? {
  bool fileSizeIsAcceptable() {
    if(this == null) {
      return true;
    } else {
      if(serviceLocator<FilesServices>().getFileSizeInMB(this!) > 2) {
        return false;
      } else {
        return true;
      }
    }
  }
}