import 'package:flutter/material.dart';
import 'package:r2b/models/cards/reply.dart';
import 'package:r2b/models/question.dart';
import 'package:r2b/models/cards/quiz.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuestionModel(),
      child: const MaterialApp(
        title: 'R2B',
        home: MyHomePage(title: 'Math Quiz'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  final questions = QuestionModel().questionsList;
  // Fonction pour obtenir une question aléatoire
  Question getQuestion() {
    final random = Random();
    final index = random.nextInt(questions.length);
    return questions[index];
  }

  late Question currentQuestion;
  final TextEditingController _reponseController = TextEditingController();

  String _message = "";

  @override
  void initState() {
    super.initState();
    currentQuestion = getQuestion();
  }

  void getNewQuestion() {
    final random = Random();
    final difficulty = random.nextInt(11); // 0 to 10
    setState(() {
      currentQuestion = MultiplicationQuestion(difficulty);
    });
    _textController.clear();
    _message = '';
  }

  void _checkAnswer() {
    String userAnswer = _reponseController.text;
    setState(() {
      _message =
          userAnswer == currentQuestion.reponse ? 'Correct !' : 'Incorrect !';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: getNewQuestion, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QuizCard(currentQuestion: currentQuestion),
            Response(reponseController: _reponseController),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Vérifier'),
            ),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
