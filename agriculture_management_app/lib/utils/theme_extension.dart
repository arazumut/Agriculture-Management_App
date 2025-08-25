import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../constants/app_colors.dart';

/// BuildContext için tema yardımcı extension
extension ThemeExtension on BuildContext {
  /// Tema modunu döndürür (true: dark, false: light)
  bool get isDarkMode => Provider.of<ThemeProvider>(this).isDarkMode;

  /// Arka plan rengini döndürür
  Color get backgroundColor =>
      isDarkMode ? Colors.grey[900]! : AppColors.background;

  /// Kart arka plan rengini döndürür
  Color get cardColor => isDarkMode ? Colors.grey[850]! : Colors.white;

  /// Birincil metin rengini döndürür
  Color get textPrimaryColor =>
      isDarkMode ? Colors.white : AppColors.textPrimary;

  /// İkincil metin rengini döndürür
  Color get textSecondaryColor =>
      isDarkMode ? Colors.white70 : AppColors.textSecondary;
}
