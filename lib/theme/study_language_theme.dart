import 'package:flutter/material.dart';
import 'package:study_language/theme/text_style.dart';

class StudyLanguageTheme {
  static ThemeData themeData = darkThemeData();

  //default dark 테마만 사용합니다
  static ThemeData darkThemeData() {
    final theme = ThemeData.dark();
    return theme.copyWith(
        textTheme: _buildTextTheme(theme.textTheme), useMaterial3: true);
  }

  static TextTheme _buildTextTheme(TextTheme theme) {
    return theme.copyWith(
        headlineLarge: TextStyles.headlineLarge,
        headlineMedium: TextStyles.headlineMedium,
        headlineSmall: TextStyles.headlineSmall,
        titleLarge: TextStyles.titleLarge,
        titleMedium: TextStyles.titleMedium,
        bodyLarge: TextStyles.bodyLarge,
        bodyMedium: TextStyles.bodyMedium,
        bodySmall: TextStyles.bodySmall,
        labelLarge: TextStyles.labelLarge,
        labelMedium: TextStyles.labelMedium);
  }
}
