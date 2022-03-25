import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your name',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'blue', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your address',
      'answers': [
        {'text': 'Abuja', 'score': 10},
        {'text': 'Lagos', 'score': 5},
        {'text': 'Minna', 'score': 3},
        {'text': 'Imo', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your fave animal',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Tiger', 'score': 7},
        {'text': 'Lion', 'score': 10},
        {'text': 'Fox', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    //if (_questionIndex < questions.length) {}
    setState(() {
      _questionIndex += 1;
    });

    //print("Answer Chosen!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
