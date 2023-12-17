import 'package:flutter/material.dart';
import 'package:study_language/widget/common/base_app_bar.dart';

class SelectThemeScreen extends StatefulWidget {
  const SelectThemeScreen({super.key});

  @override
  State<SelectThemeScreen> createState() => _SelectThemeScreenState();
}

class _SelectThemeScreenState extends State<SelectThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "영어"),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[]),
    );
  }
}
