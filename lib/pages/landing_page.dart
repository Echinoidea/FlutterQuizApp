import 'package:flutter/material.dart';
import 'quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell( // Kind of like a fancy invisible button
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Let's Quiz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

// TODO: Add multiple "game modes" and let the user pick before starting the quiz. Maybe like "True/False", "Math questions", "Programming questions", etc.