class WordTheme {
  String? word;
  String? meaning;

  WordTheme({this.word, this.meaning});

  factory WordTheme.fromJson(Map<String, dynamic> json) => WordTheme(
        word: json["word"],
        meaning: json["meaning"],
      );
}
