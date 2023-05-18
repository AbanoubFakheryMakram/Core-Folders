import 'package:core_folders/app_lib.dart';

class EndTimeValidator {

  String? validate(TimeOfDay? startTime, TimeOfDay? endTime, {String? message}) {
    if(startTime == null || endTime == null) {
      return AppLocalization.translation.requiredField;
    } else {
      if (_isValidTimeRange(startTime, endTime)) {
        return null;
      } else {
        return AppLocalization.translation.endTimeShouldBeAfterStartTime;
      }
    }
  }

  bool _isValidTimeRange(TimeOfDay startTime, TimeOfDay endTime) {
    TimeOfDay now = TimeOfDay.now();
    return ((now.hour > startTime.hour) || (now.hour == startTime.hour && now.minute >= startTime.minute)) &&
        ((now.hour < endTime.hour) || (now.hour == endTime.hour && now.minute <= endTime.minute));
  }
}