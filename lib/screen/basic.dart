import 'package:flutter/material.dart';
import 'package:study_language/widget/basic/home.dart';
import 'package:study_language/widget/basic/profile.dart';
import 'package:study_language/widget/basic/report.dart';
import 'package:study_language/widget/common/base_app_bar.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({super.key});

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: _bottomBarType[_selectedIndex].title),
      body: PageView(
        controller: _pageController,
        children: const [
          ReportComponent(),
          HomeComponent(),
          ProfileComponent()
        ],
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
    BottomBarType("report", "리포트"),
    BottomBarType("home", "홈"),
    BottomBarType("profile", "프로필")
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
  BottomBarType(this.type, this.title);

  final String type;
  final String title;
}
