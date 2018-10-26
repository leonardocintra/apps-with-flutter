import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildAppBar() {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new IconButton(
        icon: new Icon(
          Icons.person,
          color: Colors.grey,
          size: 40.0,
        ),
        onPressed: () {
          // TODO:
        },
      ),
      title: new FlutterLogo(
        size: 30.0,
        colors: Colors.red,
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.chat_bubble,
            color: Colors.grey,
            size: 40.0,
          ),
          onPressed: () {
            // TODO:
          },
        ),
      ],
    );
  }

  Widget _buildBottonBar() {
    return BottomAppBar(
      elevation: 0.0,
      color: Colors.transparent,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Row(
          children: <Widget>[],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: new Center(),
      bottomNavigationBar: _buildBottonBar(),
    );
  }
}

class RoundIconButton extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({this.icon, this.iconColor, this.onPressed})
      : size = 60.0;
  
  RoundIconButton.small({this.icon, this.iconColor, this.onPressed})
      : size = 50.0;

  RoundIconButton({this.icon, this.iconColor, this.size, this.onPressed})

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
