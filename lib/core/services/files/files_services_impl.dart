import 'dart:math';

import 'package:path/path.dart' as path;

import '../../../app_lib.dart';

class FilesServicesImpl implements FilesServices {
  @override
  String getFileExtension(File file) {
    final filePath = file.path;
    return path.extension(filePath);
  }

  @override
  String getFileSizeFormatted(String filepath, int decimals) {
    var file = File(filepath);
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }

  @override
  double getFileSizeInMB(File file) {
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

  @override
  String getBase64FromFile(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64String = base64Encode(imageBytes);
    return base64String;
  }
}