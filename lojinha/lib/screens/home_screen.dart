import 'package:flutter/material.dart';
import 'package:lojinha/pages/home_page.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[HomePage()],
    );
  }
}
