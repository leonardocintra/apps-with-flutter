import 'package:flutter/material.dart';
import 'package:lojinha/screens/home_screen.dart';

void main() => runApp(LojaVirtual());

class LojaVirtual extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Loja Virtual',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 4, 125, 141)),
        home: HomeScreen());
  }
}
