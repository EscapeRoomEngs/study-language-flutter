import 'package:flutter/material.dart';
import 'package:study_language/screen/basic/basic_screen.dart';
import 'package:study_language/screen/select_study_type/select_study_type_screen.dart';
import 'package:study_language/screen/select_word_theme/select_word_theme_screen.dart';
import 'package:study_language/screen/study_word_card.dart';
import 'package:study_language/theme/study_language_theme.dart';

import 'navigation/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Routes.home,
        themeMode: ThemeMode.dark,
        theme: StudyLanguageTheme.themeData,
        routes: {
          Routes.home: (context) => const BasicScreen(),
          Routes.selectTheme: (context) => const SelectWordThemeScreen(),
          Routes.selectStudyType: (context) => const SelectStudyTypeScreen(),
          Routes.studyWordCard: (context) => const StudyWordCardScreen()
        });
  }
}
