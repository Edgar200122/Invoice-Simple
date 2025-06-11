import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'app_colors.dart';

class  MontserratTextStyle extends TextStyle {
  const MontserratTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(
          fontFamily:AppConstants.fontFamilyMontserrat
        );
}
class  PoppinsTextStyle extends TextStyle {
  const PoppinsTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(
          fontFamily:AppConstants.fontFamilyPoppins
        );
}
class AppTextStyles {
  const AppTextStyles._();

  static TextStyle moFont20BlackWh100 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w100,
  );

  static TextStyle moFont20BlackWh200 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w200,
  );

  static TextStyle moFont20BlackWh300 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w300,
  );

  static TextStyle moFont20BlackWh400 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle moFont20BlackWh500 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle moFont20BlackWh600 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle moFont20BlackWh700 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle moFont20BlackWh800 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
  );

  static TextStyle moFont20BlackWh900 = MontserratTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
  );

//todo: ----------------------------------------------------------------------

  static TextStyle poFont20BlackWh100 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w100,
  );

  static TextStyle poFont20BlackWh200 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w200,
  );

  static TextStyle poFont20BlackWh300 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w300,
  );

  static TextStyle poFont20BlackWh400 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle poFont20BlackWh500 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle poFont20BlackWh600 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle poFont20BlackWh700 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle poFont20BlackWh800 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
  );

  static TextStyle poFont20BlackWh900 = PoppinsTextStyle(
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
  );
}




