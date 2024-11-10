import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var primaryColor = Color(0xFF4F0099);
TextStyle primaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  List<Shadow>? shadows ,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble()  : 10.sp,
    color: color ?? Colors.black,
    fontWeight: weight ?? FontWeight.w300,
    fontFamily:
    fontFamily ?? 'circularStd', // Use custom font instead of GoogleFonts
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    shadows: shadows,
    backgroundColor: backgroundColor,
    height: height,
  );
} // Define a color for dividers in the dark theme
