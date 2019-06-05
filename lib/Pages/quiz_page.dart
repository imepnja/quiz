import 'package:flutter/material.dart';
import 'package:quiz/Pages/score_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:quiz/UI/answer_btn.dart';
import 'package:quiz/UI/question_text.dart';
import 'package:quiz/UI/right_answer_overlay.dart';

import 'package:quiz/utils/question.dart';
import 'package:quiz/utils/question_list.dart';
import 'package:quiz/utils/quiz.dart';



class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new QuizPageState();
}


class QuizPageState extends State<QuizPage> {

  // new QuestionList().questions
  Question currentQuestion;
  Quiz quiz = new Quiz(new QuestionList().questions);
  
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }


  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( //Main Page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),  // true Btn
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),// false Btn
          ],
        ),
        overlayVisible ? new RightAnswerOverlay(isCorrect,
        () {
          if(quiz.length == questionNumber){
          Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
          return;
          }
          currentQuestion = quiz.nextQuestion;
          this.setState(() {
            overlayVisible = false;
            questionText = currentQuestion.question;
            questionNumber = quiz.questionNumber;
          });
        }) : new Container()
      ],
    );
  }
}

/*
import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_btn.dart';
import '../UI/question_text.dart';
import '../UI/right_answer_overlay.dart';


class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), //true button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)), // false button
          ],
        ),
        overlayShouldBeVisible == true ? new RightAnswerOverlay(isCorrect) : new Container()
      ],
    );
  }
}
*/