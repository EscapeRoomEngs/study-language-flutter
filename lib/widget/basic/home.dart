import 'package:flutter/material.dart';

import '../../navigation/routes.dart';
import '../../screen/select_theme.dart';
import '../common/icon_vertical_button.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponent();
}

class _HomeComponent extends State<HomeComponent> {
  final List<Country> _country = [
    Country("kr", "한국어", "assets/image/ic_flag_kr.svg"),
    Country("us", "영어", "assets/image/ic_flag_us.svg"),
    Country("jp", "일본어", "assets/image/ic_flag_jp.svg"),
    Country("cn", "중국어", "assets/image/ic_flag_cn.svg"),
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
                          arguments: e)
                    }))
            .toList());
  }
}

class Country {
  final String code;
  final String name;
  final String image;

  Country(this.code, this.name, this.image);
}
