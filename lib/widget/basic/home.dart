import 'package:flutter/material.dart';

import '../../navigation/routes.dart';
import '../common/icon_vertical_button.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponent();
}

class _HomeComponent extends State<HomeComponent> {
  final List<Country> _country = [
    Country("한국어", "assets/image/ic_flag_kr.svg"),
    Country("영어", "assets/image/ic_flag_us.svg"),
    Country("일본어", "assets/image/ic_flag_jp.svg"),
    Country("중국어", "assets/image/ic_flag_cn.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _country
            .map((e) => IconVerticalButton(
                name: e.name,
                image: e.image,
                onClick: () => {
                      Navigator.pushNamed(context, Routes.selectTheme,
                          arguments: {"title": e.name})
                    }))
            .toList());
  }
}

class Country {
  final String name;
  final String image;

  Country(this.name, this.image);
}
