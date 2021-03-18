import 'package:flutter/material.dart';
import 'main.dart';

class Quastion extends StatelessWidget {
  final String quistionText;

  Quastion(this.quistionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(quistionText, style: TextStyle(fontSize: 30, color: cl), textAlign: TextAlign.center,)
    );
  }
}