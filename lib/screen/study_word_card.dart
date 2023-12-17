import 'package:flutter/material.dart';
import 'package:study_language/widget/common/base_app_bar.dart';

import '../model/word_theme.dart';
import '../util/Utils.dart';

class StudyWordCardScreen extends StatefulWidget {
  const StudyWordCardScreen({super.key});

  @override
  State<StudyWordCardScreen> createState() => _StudyWordCardScreenState();
}

class _StudyWordCardScreenState extends State<StudyWordCardScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  bool isShowAnswer = false;

  @override
  Widget build(BuildContext context) {
    String? themePath = ModalRoute.of(context)?.settings.arguments as String?;

    //todo
    List<WordTheme> wordTheme = [
      WordTheme(word: "a", meaning: "aa"),
      WordTheme(word: "b", meaning: "bb"),
      WordTheme(word: "c", meaning: "cc")
    ];

    return Scaffold(
      appBar: BaseAppBar(
          title: themePath != null
              ? "${getThemeName(themePath).toUpperCase()} 테마"
              : ""),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: wordTheme
            .map<Widget>((e) => GestureDetector(
                  onLongPress: () {
                    setState(() {
                      isShowAnswer = !isShowAnswer;
                    });
                  },
                  child: Center(
                    child: Text(
                      isShowAnswer ? (e.meaning ?? "") : (e.word ?? ""),
                      style: const TextStyle(fontSize: 56),
                    ),
                  ),
                ))
            .toList(),
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
      ),
    );
  }
}
