import 'package:flutter/material.dart';

class Question {
  final String question;
  final int reponse;
  final int difficulty;
  final String topic;

  Question(
      {required this.question,
      required this.reponse,
      this.difficulty = 1,
      this.topic = ""});
}

class QuestionModel extends ChangeNotifier {
  final List<Question> _questions = [
    Question(question: "Combien font 3x2", reponse: 6),
    Question(question: "Combien font 4x2", reponse: 8)
  ];

  List<Question> get questionsList => _questions;
}
