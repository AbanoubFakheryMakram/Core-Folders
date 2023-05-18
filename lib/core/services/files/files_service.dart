import '../../../app_lib.dart';

abstract class FilesServices {
  String getFileSizeFormatted(String filepath, int decimals);
  double getFileSizeInMB(File file);
  String getFileExtension(File file);
  String getBase64FromFile(File file);
}