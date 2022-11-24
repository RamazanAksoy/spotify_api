import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constans/colors.dart';

class Styles {
  static TextStyle thinFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w300,
        height: height ?? 1.24,
      );



  static TextStyle titleStyle(
          {double? fontSize, Color? color, double? height}) =>
          GoogleFonts.inter(fontSize: fontSize ?? 16.sp,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: height ?? 1.24,);


        
  static TextStyle bodyStyle(
          {double? fontSize, Color? color, double? height}) =>
          GoogleFonts.inter(fontSize: fontSize ?? 15.sp,
        color: color ?? AppColors.black,
        letterSpacing: 0.4,
        height: height ?? 1.24,);


  static TextStyle regularFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 13,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w400,
        height: height ?? 1.24,
      );

  static TextStyle mediumFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w500,
        height: height ?? 1.24,
      );

  static TextStyle semiboldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w600,
        height: height ?? 1.24,
      );

  static TextStyle boldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w700,
        height: height ?? 1.24,
      );
}
