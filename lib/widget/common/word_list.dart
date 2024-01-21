import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_language/model/word_theme.dart';
import 'package:study_language/screen/study_word_card/word_card.dart';

import '../../navigation/routes.dart';

class WordList extends StatefulWidget {
  const WordList({super.key, required this.path, required this.route});

  final String path;
  final String route;

  @override
  State<WordList> createState() => _WordList();
}

class _WordList extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordTheme>>(
        future: wordList(context, widget.path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          } else {
            List<WordTheme> wordTheme = snapshot.data as List<WordTheme>;
            switch (widget.route) {
              case Routes.studyWordCard:
                return WordCard(wordTheme: wordTheme);
              default:
                return Container();
            }
          }
        });
  }

  Future<List<WordTheme>> wordList(BuildContext context, String path) async {
    // Load as String
    final rootBundleJson = await rootBundle.loadString(path);
    return WordThemeList.fromJson(rootBundleJson).wordThemes ?? <WordTheme>[];
  }
}
