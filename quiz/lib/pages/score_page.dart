import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget{

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Seus pontos: ', style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
          new Text(score.toString() + '/' + totalQuestions.toString(), style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => print('apertou o botao de pontos'),
          )
        ],
      ),
    );
  }
}