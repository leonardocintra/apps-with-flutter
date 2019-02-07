import 'package:flutter/material.dart';
import 'package:lojinha/tabs/home_tab.dart';
import 'package:lojinha/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomePage(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}
