import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xff5669FF);
  static const Color backgroundLight = Color(0xffF2FEFF);
  static const Color backgroundDark = Color(0xff101127);
  static const Color black = Color(0xff1C1C1C);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey = Color(0xff7B7B7B);
  static const Color red = Color(0xffFF5659);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
    ),
    scaffoldBackgroundColor: backgroundLight,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: backgroundLight,
      ),
      selectedItemColor: backgroundLight,
      unselectedItemColor: backgroundLight,
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: backgroundLight,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: backgroundLight,
      shape: CircleBorder(),
    ),
    textTheme: TextTheme(
      labelSmall: GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: white,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
    ),
    scaffoldBackgroundColor: backgroundDark,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: primary),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: primary),
        borderRadius: BorderRadius.circular(16.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: white,
      ),
      selectedItemColor: white,
      unselectedItemColor: white,
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: white,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: backgroundDark,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
    textTheme: TextTheme(
      labelSmall: GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: white,
      ),
    ),
  );
}
