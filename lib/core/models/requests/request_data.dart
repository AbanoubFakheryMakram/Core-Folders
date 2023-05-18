import 'package:core_folders/app_lib.dart';

class RequestData {
  Map<String, dynamic>? headers;
  Map<String, dynamic>? params;
  String? contentType;

  RequestData({this.headers, this.contentType = Headers.jsonContentType, this.params});
}