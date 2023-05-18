import 'package:core_folders/app_lib.dart';

class PickFileServiceImpl implements PickFileService {

  FilePicker filePicker = serviceLocator<FilePicker>();

  @override
  Future<FilePickerResult?> pickFiles(List<String> allowedExtensions) async {
    return await filePicker.pickFiles(
      allowCompression: true,
      allowMultiple: true,
      allowedExtensions: allowedExtensions,
    );
  }

  @override
  Future<FilePickerResult?> pickFile({FileType fileType = FileType.any, List<String> allowedExtensions = const ['pdf', 'doc']}) async {
    return await filePicker.pickFiles(
      allowCompression: true,
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
      type: fileType,
    );
  }
}