import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle homeTitle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColors.black);
  static TextStyle homeSubtitle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.black);
  static TextStyle bottomBarTextStyle = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold,);
  static TextStyle normalTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static Gradient gridBenefitsLine = const LinearGradient(
    colors: [
      Color(0xffE0017E),
      Color(0xff48D77E),
      Color(0xff5130B2),
    ],
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
  );
  static TextStyle textFieldErrorStyle = TextStyle(color: AppColors.error, fontSize: 11.sp);
  static TextStyle textFieldLabelStyle = TextStyle(color: AppColors.textFormFieldHintColor, fontSize: 14.sp, fontWeight: FontWeight.w400);
  static EdgeInsets textFieldPadding = EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w);
  static TextStyle mediaGalleryCategoryStyle = TextStyle(
    color: AppColors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}