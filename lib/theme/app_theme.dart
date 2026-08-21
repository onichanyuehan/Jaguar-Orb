import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
 AppTheme._();

 static ThemeData get darkHolographicTheme {
 return ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.spaceBackground,
  primaryColor: AppColors.neonCyan,
  colorScheme: const ColorScheme.dark(
  primary: AppColors.neonCyan,
  secondary: AppColors.electricPurple,
  surface: AppColors.glassBase,
  background: AppColors.spaceBackground,
  onPrimary: Colors.black,
  onSecondary: Colors.white,
  onSurface: AppColors.textPrimary,
  onBackground: AppColors.textPrimary,
  ),
  textTheme: GoogleFonts.rajdhaniTextTheme(
  ThemeData.dark().textTheme,
  ).apply(
  bodyColor: AppColors.textPrimary,
  displayColor: AppColors.textPrimary,
  ),
  appBarTheme: const AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  ),
  drawerTheme: const DrawerThemeData(
  backgroundColor: Colors.transparent,
  elevation: 0,
  ),
 );
 }
}
