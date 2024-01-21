import 'package:flutter/material.dart';
import 'package:study_language/widget/app_bar/title_app_bar.dart';

import '../../navigation/routes.dart';
import '../../util/Utils.dart';
import '../../widget/common/word_list.dart';

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

    return Scaffold(
        appBar: TitleAppBar(
            title: themePath != null
                ? "${getThemeName(themePath).toUpperCase()} 테마"
                : ""),
        body: WordList(
          path: themePath ?? "",
          route: Routes.studyWordCard,
        ));
  }
}
