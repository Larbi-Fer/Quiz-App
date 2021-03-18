import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
Color cl = Colors.black;
Color bg = Colors.white;

class _MyAppState extends State<MyApp> {
  /* Color w = Colors.white;
  Color b = Colors.black;
  Color w26 = Colors.white24;
  Color w54 = Colors.white54; */

  bool isSwitched = false;

  int _quistionIndex = 0;
  List<Map<String, Object>> answers = [];

  Function answerQuestion(String answer, int score) => () {
    // print({ "i": index, "a": answer });
    answers.add({ "answer": answer, "score": score });
    setState(() {
      _quistionIndex += 1;
    });
    print(_quistionIndex);
  };

  void restartApp() {
    setState(() {
      _quistionIndex = 0;
      answers.clear();
    });
  }

  void r() {
    if ( _quistionIndex > 0 ) {
      setState(() {
        _quistionIndex -= 1;
        answers.removeAt(_quistionIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> _quistions = [
      {
        'questionText': "What's your favorite color ?",
        "answers": { "text": [
            {"text": "blue", "score": 10},
            {"text": "green", "score": 30},
            {"text": "black", "score": 20},
            {"text": "white", "score": 15},
          ],
          "function": answerQuestion
        }
      },
      {
        'questionText': "What's your favorite animal ?",
        "answers": { "text": [
            {"text": 'Rabbit', "score": 50},
            {"text": 'Tiger', "score": 70},
            {"text": 'Elephant', "score": 10},
            {"text": 'Lion', "score": 30},
          ],
          "function": answerQuestion
        }
      },
    ];

    /* final _answers = [
      { "text": ['Answer 1', 'Answer 2'], "function": answerQuestion },
      { "text": ['Answer 1', 'Answer 2', 'Answer 1', 'Answer 2'], "function": answerQuestion },
      { "text": [], "function": answerQuestion },
    ]; */
    // print(_quistions(answerQuestion));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (isSwitch) {
                setState(() {
                  isSwitched = isSwitch;
                  if ( isSwitch ) {
                    cl = Colors.white; bg = Colors.black87;
                  } else {
                    cl = Colors.black; bg = Colors.white;
                  }
                });
              },
              activeColor: Colors.white,
            )
          ],
        ),
        body: Container(
          color: bg,
          child: _quistionIndex < _quistions.length ? Quiz(_quistions[_quistionIndex]['questionText'], _quistions[_quistionIndex]["answers"]) : Result(answers, _quistions, restartApp)
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: _quistionIndex == 0 ? null : r,
        ),
      )
    );
  }
}