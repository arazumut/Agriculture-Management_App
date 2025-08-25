import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../utils/theme_extension.dart';

/// Tema güncelleyici sınıf - tüm ekranları güncellemek için
class ThemeUpdater {
  /// Bir dosyayı tema değişimine duyarlı hale getirmek için gereken değişiklikleri yapar
  static void updateScreenFile(String filePath) {
    // 1. Import ekle
    // import '../utils/theme_extension.dart';

    // 2. State sınıfına isDarkMode değişkeni ekle
    // late bool isDarkMode;

    // 3. build metoduna isDarkMode ataması ekle
    // isDarkMode = context.isDarkMode;

    // 4. backgroundColor değişikliği
    // backgroundColor: isDarkMode ? Colors.grey[900] : AppColors.background,

    // 5. Container renk değişiklikleri
    // color: isDarkMode ? Colors.grey[850] : Colors.white,

    // 6. Text renk değişiklikleri
    // color: isDarkMode ? Colors.white : AppColors.textPrimary,
    // color: isDarkMode ? Colors.white70 : AppColors.textSecondary,
  }
}
