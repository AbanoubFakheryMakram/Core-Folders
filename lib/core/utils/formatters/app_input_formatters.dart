
import 'package:flutter/services.dart';

import 'formatters_lib.dart';

class AppInputFormatters {
  static ThousandsFormatter thousandsFormatter({bool allowFraction = true}) => ThousandsFormatter(allowFraction: allowFraction);
  static DecimalFormatter decimalFormatter(int decimalRange) => DecimalFormatter(decimalRange: decimalRange);
  static LengthLimitingTextInputFormatter limitedLengthFormatter(int maxLength) => LengthLimitingTextInputFormatter(maxLength);
  static FilteringTextInputFormatter customAllowFormatter(String filterPattern) => FilteringTextInputFormatter.allow(filterPattern);
  static FilteringTextInputFormatter customDenyFormatter(String filterPattern) => FilteringTextInputFormatter.deny(filterPattern);
  static TextInputFormatter onlyDigitsFormatter() => FilteringTextInputFormatter.digitsOnly;
  static TextInputFormatter singleLineFormatter() => FilteringTextInputFormatter.singleLineFormatter;
}