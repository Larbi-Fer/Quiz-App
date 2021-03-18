import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map _answerText;
  // final Function x;

  Answer(this._answerText);

  @override
  Widget build(BuildContext context) {
    /* final Buttons = _answerText["text"].map((answer) {
      return RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answer, style: TextStyle(fontSize: 25),),
        onPressed: this._answerText['function'],
      );
    }).toList(); */
    final List<Widget> Function() buttons = () {
      List<Widget> list = [];
      for (var i = 0; i < _answerText['text'].length; i++) {
        list.add(Container(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(_answerText['text'][i]["text"]),
            onPressed: _answerText['function'](_answerText['text'][i]["text"], _answerText['text'][i]["score"]),
          ),
        ));
      }
      return list;
    };

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: buttons()
        // children: <Widget>[Text('test')],
      )
    );
  }
}