import 'dart:convert';

class WordTheme {
  String? word;
  String? meaning;

  WordTheme({this.word, this.meaning});

  factory WordTheme.fromJson(Map<String, dynamic> json) => WordTheme(
        word: json["word"],
        meaning: json["meaning"],
      );
}

class WordThemeList {
  final List<WordTheme>? wordThemes;

  WordThemeList({this.wordThemes});

  factory WordThemeList.fromJson(String jsonString) {
    List<dynamic> listFromJson = json.decode(jsonString);
    List<WordTheme> wordThemes = <WordTheme>[];

    wordThemes =
        listFromJson.map((wordTheme) => WordTheme.fromJson(wordTheme)).toList();
    return WordThemeList(wordThemes: wordThemes);
  }
}
