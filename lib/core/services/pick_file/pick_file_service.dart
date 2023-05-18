import 'package:core_folders/app_lib.dart';

abstract class PickFileService {
  Future<FilePickerResult?> pickFile({FileType fileType = FileType.any, List<String> allowedExtensions = const ['pdf', 'doc']});
  Future<FilePickerResult?> pickFiles(List<String> allowedExtensions);
}