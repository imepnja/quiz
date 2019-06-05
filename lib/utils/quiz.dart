import 'package:flutter/material.dart';
import 'package:quiz/utils/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/utils/question_list.dart';

class Quiz extends StatelessWidget {
  List<Question> _questions;
  //Questions _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;



  Quiz(this._questions) {
    _questions.add(new Question("Test Question2", true));
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get questionNumber => _currentQuestionIndex + 1;
  int get length => _questions.length;
  int get score => _score;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if(isCorrect) _score++;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

  // Get Data from Firebase Cloud