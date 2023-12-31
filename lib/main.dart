import 'package:flutter/material.dart';
import 'package:study_language/screen/basic.dart';
import 'package:study_language/screen/select_study_type.dart';
import 'package:study_language/screen/select_theme.dart';
import 'package:study_language/screen/study_word_card.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          Routes.home: (context) => const BasicScreen(),
          Routes.selectTheme: (context) => const SelectThemeScreen(),
          Routes.selectStudyType: (context) => const SelectStudyTypeScreen(),
          Routes.studyWordCard: (context) => const StudyWordCardScreen()
        });
  }
}
