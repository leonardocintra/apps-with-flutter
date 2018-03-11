import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';

import '../UI/question_text.dart';
import '../UI/answer_button.dart';
import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("Sua resposta esta certa!")),
            new QuestionText("Dois mais tres é cinco?", 1),
            new AnswerButton(false, () => print("Sua resposta esta errada!")),
          ],
        ),
        new CorrectWrongOverlay(false),
      ],
    );
  }
}