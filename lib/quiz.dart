import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/quastion.dart';

class Quiz extends StatelessWidget {
  final String _questionText;
  final Map _answers;

  Quiz(this._questionText, this._answers);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Quastion(_questionText),
        Answer(_answers),
      ],
    );
  }
}