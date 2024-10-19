import 'dart:math';

import 'package:flutter/material.dart';

class Question {
  String question;
  String reponse;
  int difficulty;
  String topic;

  Question(
      {this.question = "",
      this.reponse = "",
      this.difficulty = 1,
      this.topic = ""});
}

class QuestionModel extends ChangeNotifier {
  final List<Question> _questions = [
    MultiplicationQuestion(0),
    MultiplicationQuestion(0),
    MultiplicationQuestion(1),
    MultiplicationQuestion(2),
    MultiplicationQuestion(3),
    MultiplicationQuestion(5),
  ];

  List<Question> get questionsList => _questions;
}

double formatDouble(double number, int decimalPlaces) {
  return double.parse(number.toStringAsFixed(decimalPlaces));
}

class MultiplicationQuestion extends Question {
  MultiplicationQuestion(int difficulty)
      : super(difficulty: difficulty, topic: "Multiplication") {
    final random = Random();
    final maxValues = [10, 10, 100, 10, 100, 10, 100, 1000, 100, 1000, 1000000];
    final numFactors = [2, 3, 2, 5, 3, 2, 2, 2, 3, 3, 2];
    final useFloats = difficulty >= 5;

    final maxValue = maxValues[difficulty];
    final numFactorsForDifficulty = numFactors[difficulty];

    final factors = List.generate(
      numFactorsForDifficulty,
      (_) => useFloats
          ? formatDouble(random.nextDouble() * maxValue, 2)
          : random.nextInt(maxValue) + 1,
    );

    final questionString = factors.join(' x ');
    final answer = factors.reduce((value, element) => value * element);

    question = '$questionString = ?';
    reponse = answer.toString();
  }
}
