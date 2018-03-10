import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Expanded(
              child: new Material(
                color: Colors.greenAccent,
                child: new InkWell(
                  onTap: () => print("Sua resposta esta correta"),
                  child: new Center(
                    child: new Container(
                      child: new Text("Certo"),
                    ),
                  )
                ),
              ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.redAccent,
                child: new InkWell(
                  onTap: () => print("Sua resposta esta errada"),
                  child: new Center(
                    child: new Container(
                      child: new Text("Errado"),
                    ),
                  )
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}