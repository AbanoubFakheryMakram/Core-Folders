import 'package:core_folders/app_lib.dart';

class AppUtils {

  static bool enableDevicePreview = false;

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void showSnakeBar(String msg, {Color? backgroundColor}) {
    ScaffoldMessenger.of(NavigationService.context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(msg, style: TextStyle(fontSize: 14.sp)),
      ),
    );
  }

  String getTextBasedOnLanguage(String arabicName, String latinName) {
    var settings = serviceLocator<ConfigurationsService>();
    if(settings.isArabic()) {
      return arabicName;
    } else {
      return latinName;
    }
  }

  List<List> chunkList(List l, {int chunkSize = 3}) {
    List<List> chunks = [];
    for (var i = 0; i < l.length; i += chunkSize) {
      chunks.add(l.sublist(i, i+chunkSize > l.length ? l.length : i + chunkSize));
    }
    return chunks;
  }

  String? convertYoutubeUrlToId(String url, {bool trimWhitespaces = true}) {
    try {
      if (!url.contains("http") && (url.length == 11)) return url;
      if (trimWhitespaces) url = url.trim();

      for (var exp in [
        RegExp(r".+\.be/(.+)٫*"),
        RegExp(r"^https://(?:www\.|m\.)?youtube\.com/watch\?v=([_\-a-zA-Z\d]{11}).*$"),
        RegExp(r"^https://(?:www\.|m\.)?youtube(?:-nocookie)?\.com/embed/([_\-a-zA-Z\d]{11}).*$"),
        RegExp(r"^https://youtu\.be/([_\-a-zA-Z\d]{11}).*$"),
        RegExp(r"^.*(youtu.be/|v/|embed/|watch\?|youtube.com/user/[^#]*#([^/]*?/)*)\??v?=?([^#&?]*).*"),
      ]) {
        try {
          RegExpMatch? match = exp.firstMatch(url);
          if (match!.groupCount >= 1) {
            return match.group(match.groupCount);
          }
        } catch (ex) {}
      }

      return url;
    } catch (ex) {
      return url;
    }
  }

  Future<void> sendMail(String email, {String? body}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: body ?? 'subject=Feedback&body=This is my feedback, ',
    );

    var url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void openMap(String googleMapUrl) {
    openUrl(googleMapUrl);
  }
}