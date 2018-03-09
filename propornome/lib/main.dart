import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new ProporNome());

class ProporNome extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    final wordPair = new WordPair.random();

    return new MaterialApp(
      title: 'Bem vindo ao Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Bem vindo ao Flutter'),
        ),
        body: new Center(
          child: new Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}