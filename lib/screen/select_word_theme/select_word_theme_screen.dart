import 'package:flutter/material.dart';
import 'package:study_language/screen/basic/home_content.dart';
import 'package:study_language/widget/app_bar/title_app_bar.dart';

import 'word_theme_list.dart';

class SelectWordThemeScreen extends StatefulWidget {
  const SelectWordThemeScreen({super.key});

  @override
  State<SelectWordThemeScreen> createState() => _SelectWordThemeScreenState();
}

class _SelectWordThemeScreenState extends State<SelectWordThemeScreen> {
  @override
  Widget build(BuildContext context) {
    Country? country = ModalRoute.of(context)?.settings.arguments as Country?;

    return Scaffold(
      appBar: TitleAppBar(
        title: country != null ? country.name : "",
        onClickBack: () {
          Navigator.pop(context);
        },
      ),
      body: WordThemeList(
        country: country ?? Country("", "", ""),
      ),
    );
  }
}
