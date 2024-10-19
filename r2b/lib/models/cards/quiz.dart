import 'package:flutter/material.dart';
import 'package:r2b/models/question.dart';
import 'dart:math';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.currentQuestion,
  });

  final Question currentQuestion;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: max(200, min(600, MediaQuery.of(context).size.width * 0.8)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    currentQuestion.question,
                    textAlign: TextAlign.center,
                    textScaler: const TextScaler.linear(2.0),
                  ),
                ),
                Expanded(
                  child: Text("diff: ${currentQuestion.difficulty}/10"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
