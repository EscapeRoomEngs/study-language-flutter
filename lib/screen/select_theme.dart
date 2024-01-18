import 'package:flutter/material.dart';
import 'package:study_language/screen/basic/home_content.dart';
import 'package:study_language/widget/common/base_app_bar.dart';

import '../widget/common/theme_list.dart';

class SelectThemeScreen extends StatefulWidget {
  const SelectThemeScreen({super.key});

  @override
  State<SelectThemeScreen> createState() => _SelectThemeScreenState();
}

class _SelectThemeScreenState extends State<SelectThemeScreen> {
  @override
  Widget build(BuildContext context) {
    Country? country = ModalRoute.of(context)?.settings.arguments as Country?;

    return Scaffold(
      appBar: BaseAppBar(title: country != null ? country.name : ""),
      body: ThemeList(
        country: country ?? Country("", "", ""),
      ),
    );
  }
}
