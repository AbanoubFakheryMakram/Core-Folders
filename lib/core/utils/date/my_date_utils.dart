import 'package:core_folders/app_lib.dart';
import 'package:intl/intl.dart';

class MyDateUtils {

  static var configController = serviceLocator<ConfigurationsService>();

  static String getFullDateFormat(DateTime date) {
    return DateFormat.yMMMMEEEEd(configController.locale).format(date); // ex: Friday, December 31, 2022
  }

  static String getDayNumber(DateTime date) {
    return DateFormat.d(configController.locale).format(date);  // ex: 30
  }

  static String getTrimmedDayName(DateTime date) {
    return DateFormat.E(configController.locale).format(date);  // ex: Fri
  }

  static String getFullDayName(DateTime date) {
    return DateFormat.EEEE(configController.locale).format(date);  // ex: Friday
  }

  static DateTime parseDate(String date) {
    List<String> dates = date.split(date.contains('/') ? '/' : '-');
    String newDate = dates[0] + dates[1] + dates[2];   // ex: 2022-12-21 || 2022/12/21
    return DateTime.parse(newDate);
  }

  static String formatDate(DateTime date) {    // ex: ١٢ ديسمبر ٢٠٢٢
    var settings = serviceLocator<ConfigurationsService>();
    String lang = settings.locale;
    return DateFormat("${lang == 'ar' ? 'd' : 'dd'} MMM yyyy", lang).format(date).replaceAll(",", "");
  }

  static int getDaysCountOfAMonth(DateTime date) => DateTimeRange(  // ex: 31
    start: DateTime(date.year, date.month),
    end: DateTime(date.year, date.month + 1),
  ).duration.inDays;

  static List<DateTime> getAvailableDaysInAMonth(DateTime date, {int maxDaysToReproduce = 7}) {
    List<DateTime> daysOfMonth = [];
    for (int i = 1; i < getDaysCountOfAMonth(date) + 1; i++) {
      if(i >= date.day) {
        if(daysOfMonth.length < maxDaysToReproduce) {
          daysOfMonth.add(DateTime(date.year, date.month, i));
        } else {
          break;
        }
      }
    }

    return daysOfMonth;
  }

  static List<DateTime> generateDays({int maxDaysToReproduce = 7, DateTime? start}) {  // note: the start date is included in maxDaysToReproduce
    List<DateTime> days = [];
    DateTime startDate = start ?? DateTime.now();
    days.add(startDate);
    for(int i = 0; i < maxDaysToReproduce - 1; i++) {
      var newDay = days[i].add(const Duration(days: 1));
      days.add(newDay);
    }

    return days;
  }

  // range (0 : 24) -> start : end
  static List<String> createTimeSlot(int start, int end, {int stepMints = 30, String langCode = "en"}) {
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(now.year, now.month, now.day, start, 0, 0);
    DateTime endTime = DateTime(now.year, now.month, now.day, end, 0, 0);
    Duration step = Duration(minutes: stepMints);

    List<String> timeSlots = [];

    timeSlots.add(DateFormat("h:mm a", langCode).format(startTime));  // Hm
    while(startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      timeSlots.add(DateFormat("h:mm a", langCode).format(timeIncrement));
      startTime = timeIncrement;
    }

    return timeSlots;
  }
}