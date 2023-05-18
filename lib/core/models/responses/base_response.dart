import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
  final num? Status; // 1 -> fail  ||  0 -> success
  final String? Message;

  const BaseResponse({
    required this.Status,
    required this.Message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        Status: json["Status"],
        Message: json["Message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Status": Status,
        "Message": Message,
      };

  @override
  List<Object?> get props => [Status, Message];
}
