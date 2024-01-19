import 'package:flutter/material.dart';
import 'package:study_language/screen/basic/home_content.dart';
import 'package:study_language/screen/basic/profile_content.dart';
import 'package:study_language/screen/basic/report_content.dart';
import 'package:study_language/widget/app_bar/title_app_bar.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({super.key});

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: _bottomBarType[_selectedIndex].title),
      body: PageView(
        controller: _pageController,
        children: _bottomBarType.map((e) => e.widget).toList(),
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  final PageController _pageController = PageController(initialPage: 1);

  //region bottomNavigationBar
  int _selectedIndex = 1;

  final List<BottomBarType> _bottomBarType = [
    BottomBarType("리포트", const ReportContent()),
    BottomBarType("홈", const HomeContent()),
    BottomBarType("프로필", const ProfileContent())
  ];

  Widget bottomNavigation() {
    return BottomNavigationBar(
      selectedFontSize: 0,
      unselectedFontSize: 0,
      items: _bottomBarType
          .map((e) => BottomNavigationBarItem(
              icon: Text(e.title,
                  style: const TextStyle(color: Color(0xFFB0B0B0))),
              activeIcon: Text(e.title),
              label: ""))
          .toList(),
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _pageController.jumpToPage(index);
        });
      },
    );
  }
//endregion
}

class BottomBarType {
  BottomBarType(this.title, this.widget);

  final String title;
  final Widget widget;
}
