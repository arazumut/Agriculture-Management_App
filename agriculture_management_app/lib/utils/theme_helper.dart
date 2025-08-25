import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../constants/app_colors.dart';

/// Tema ile ilgili yardımcı fonksiyonlar içeren sınıf
class ThemeHelper {
  /// Bir widget'ın arka plan rengini tema moduna göre döndürür
  static Color getBackgroundColor(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return isDarkMode ? Colors.grey[900]! : AppColors.background;
  }

  /// Kart arka plan rengini tema moduna göre döndürür
  static Color getCardColor(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return isDarkMode ? Colors.grey[850]! : Colors.white;
  }

  /// Birincil metin rengini tema moduna göre döndürür
  static Color getTextPrimaryColor(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return isDarkMode ? Colors.white : AppColors.textPrimary;
  }

  /// İkincil metin rengini tema moduna göre döndürür
  static Color getTextSecondaryColor(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return isDarkMode ? Colors.white70 : AppColors.textSecondary;
  }
}
