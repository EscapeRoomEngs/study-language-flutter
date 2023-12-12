import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_language/main.dart';
import 'package:study_language/widget/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "홈"),
      body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            country(name: "한국어", image: 'assets/image/ic_flag_kr.svg'),
            const SizedBox(width: 24),
            country(name: "영어", image: 'assets/image/ic_flag_us.svg'),
            const SizedBox(width: 24),
            country(name: "일본어", image: 'assets/image/ic_flag_jp.svg'),
            const SizedBox(width: 24),
            country(name: "중국어", image: 'assets/image/ic_flag_cn.svg')
          ]),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  //region body

  Widget country({required String name, required String image}) {
    return Center(
        child: InkWell(
            onTap: () => {Navigator.pushNamed(context, Routes.selectTheme)},
            child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(image),
                    const SizedBox(height: 7),
                    Text(name)
                  ],
                ))));
  }

  //endregion

  //region bottomNavigationBar
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet, size: 0),
          label: '리포트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet, size: 0),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet, size: 0),
          label: '프로필',
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.lightGreen,
      onTap: _onItemTapped,
    );
  }
//endregion
}
