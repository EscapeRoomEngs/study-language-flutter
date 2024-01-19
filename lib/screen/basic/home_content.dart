import 'package:flutter/material.dart';

import '../../navigation/routes.dart';
import '../../widget/common/icon_vertical_button.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeComponent();
}

class _HomeComponent extends State<HomeContent> {
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
            .map((item) => IconVerticalButton(
                name: item.name,
                image: item.image,
                onClick: () => {
                      Navigator.pushNamed(context, Routes.selectTheme,
                          arguments: item)
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
