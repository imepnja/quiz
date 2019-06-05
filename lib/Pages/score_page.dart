import 'package:flutter/material.dart';
import 'package:quiz/Pages/quiz_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);


  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            new Text("Your Score:", style: new TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
            new Text(score.toString() + " / " + totalQuestions.toString(), 
              style: new TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
            
            new Text("Tap to restart!", style: new TextStyle(color: Colors.white, fontSize: 20.0, ),)
          ],
        ),
      )
    );
  }
}


