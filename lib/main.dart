import 'package:flutter/material.dart';
import 'package:quiz/Pages/quiz_page.dart';
import 'package:quiz/Pages/score_page.dart';
import 'Pages/landing_page.dart';
import 'package:flutter/services.dart';

void main() {   /*=> runApp(MyApp());*/
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MaterialApp(
    home: new LandingPage(),
  ));
}
