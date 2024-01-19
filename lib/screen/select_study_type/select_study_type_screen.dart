import 'package:flutter/material.dart';
import 'package:study_language/navigation/routes.dart';
import 'package:study_language/util/Utils.dart';
import 'package:study_language/widget/app_bar/title_app_bar.dart';
import 'package:study_language/widget/button/filled_text_button.dart';

class SelectStudyTypeScreen extends StatefulWidget {
  const SelectStudyTypeScreen({super.key});

  @override
  State<SelectStudyTypeScreen> createState() => _SelectStudyTypeScreenState();
}

class _SelectStudyTypeScreenState extends State<SelectStudyTypeScreen> {
  final List<StudyType> _studyType = [
    StudyType("단어카드", Routes.studyWordCard),
    StudyType("받아쓰기", Routes.home),
    StudyType("주관식", Routes.home),
    StudyType("객관식", Routes.home),
  ];

  @override
  Widget build(BuildContext context) {
    String? themePath = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
        appBar: TitleAppBar(
            onClickBack: () {
              Navigator.pop(context);
            },
            title: themePath != null
                ? "${getThemeName(themePath).toUpperCase()}테마"
                : ""),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _studyType
                .map((item) => FilledTextButton(
                      name: item.title,
                      onClick: () {
                        Navigator.pushNamed(context, item.route,
                            arguments: themePath ?? "");
                      },
                    ))
                .toList(),
          ),
        ));
  }
}

class StudyType {
  StudyType(this.title, this.route);

  final String title;
  final String route;
}
