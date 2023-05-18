import 'package:core_folders/app_lib.dart';

class EndDateValidator {
  String? validate(DateTime? start, DateTime? end, {String? message}) {
    if(start == null) {
      return AppLocalization.translation.determineStartDate;
    } else if(end == null) {
      return AppLocalization.translation.determineEndDate;
    } else {
      if (end.isAfter(start) && !end.isSameDate(start)) {
        return null;
      } else {
        return message ?? AppLocalization.translation.endDateErrorMsg;
      }
    }
  }

  String? validate2(DateTime? start, DateTime? end, {String? message}) {
    if(start == null) {
      return AppLocalization.translation.determineStartDate;
    } else if(end == null) {
      return AppLocalization.translation.determineEndDate;
    } else {
      if (end.isAfter(start) || end.isSameDate(start)) {
        return null;
      } else {
        return message ?? AppLocalization.translation.endDateErrorMsg;
      }
    }
  }
}