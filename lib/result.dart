import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final List<Map<String, Object>> answers;
  final List<Map<String, Object>> questions;
  final Function callBack;

  var x = -1;
  var score = 0;

  Result(this.answers, this.questions, this.callBack);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          ...answers.map((answer) {
            x++;
            score += answer["score"];
            return Text('${questions[x]["questionText"]} :\t\t ${answer["answer"]}', style: TextStyle(fontSize: 20, color: cl),);
              // Text(_quistions[x]["answers"][e['i']]),
          }).toList(),
          SizedBox(height: 10,),
          Text('Score: $score', style: TextStyle(color: Colors.blue, fontSize: 25),),
          SizedBox(height: 35,),
          Divider(color: Colors.black26,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              onPressed: callBack,
              child: Text('Restart The App', style: TextStyle(color: Colors.blue, fontSize: 25),),
            ),
          ),
        ],
      ),
    );
  }
}