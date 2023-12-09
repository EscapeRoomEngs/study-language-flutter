import 'package:flutter/material.dart';
import 'package:study_language/screen/home.dart';
import 'package:study_language/screen/select_theme.dart';

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
          Routes.home: (context) => const HomeScreen(),
          Routes.selectTheme: (context) => const SelectThemeScreen()
        });
  }
}

class Routes {
  static const String home = "/home";
  static const String selectTheme = "/selectTheme";
}
