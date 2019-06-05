import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/utils/question.dart';
import 'package:quiz/utils/quiz.dart';

class QuestionList extends StatelessWidget {

  List<Question> questions = ([new Question("no questions yet", false)]);
    // = ([
    // new Question("Elon Musk is human", false),
    // new Question("Pizza is healthy", false),
    // new Question("Flutter is awesome", true),
    // new Question("I like you", true)
    // ]);
  

  QuestionList(){
    this.questions.add(new Question("Test Question", true));
    StreamBuilder<QuerySnapshot>(
      
      stream: Firestore.instance.collection('books').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    
        if (!snapshot.hasData){
          print("no data");
        }else{
          print(snapshot.data.toString());
        }
            // snapshot.data.documents.map((DocumentSnapshot document) {
            //   this.questions.add(new Question(document["question"], document["answer"]));
            // }).toList();
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

//document['title'],document['author'],
