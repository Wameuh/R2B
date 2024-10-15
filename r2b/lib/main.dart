import 'package:flutter/material.dart';
import 'package:r2b/models/question.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'R2B',
      home: const MyHomePage(title: 'Math Quiz'),
      debugShowCheckedModeBanner: false,
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
  final List<Question> questions = [
    Question(question: "Combien font 3x2", reponse: 6),
    Question(question: "Combien font 4x2", reponse: 8)
  ];
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
    setState(() {
      currentQuestion = getQuestion();
    });
    _textController.clear();
    _message = '';
  }

  void _checkAnswer() {
    int userAnswer = int.tryParse(_reponseController.text) ?? 0;
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
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 200,
                maxWidth:
                    max(200, min(600, MediaQuery.of(context).size.width * 0.8)),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text('Votre réponse :'),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Entrez votre réponse',
                        ),
                        controller: _reponseController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
