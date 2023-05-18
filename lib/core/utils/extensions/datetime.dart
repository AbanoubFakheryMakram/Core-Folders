
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonthOfYear(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool dateIsAcceptable() {
    if(this == null) {
      return true;
    } else {
      DateTime timeNow = DateTime.now();
      if(timeNow.isSameDate(this)) {
        return false;
      } else {
        return true;
      }
    }
  }
}