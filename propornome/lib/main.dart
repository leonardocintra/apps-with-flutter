import 'package:flutter/material.dart';

void main() => runApp(new ProporNome());

class ProporNome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Bem vindo ao Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Bem vindo ao Flutter'),
        ),
        body: new Center(
          child: new Text('Ola Mundo!'),
        ),
      ),
    );
  }
}

