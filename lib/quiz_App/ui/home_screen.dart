import 'dart:core';
import 'package:dima/quiz_App/ui/result_screen.dart';
import 'package:dima/quiz_App/widget/button.dart';
import 'package:flutter/material.dart';

class MYApp extends StatefulWidget {
  const MYApp({Key? key}) : super(key: key);

  @override
  State<MYApp> createState() => _MYAppState();
}

class _MYAppState extends State<MYApp> {
  var _questionsIndex = 0;
  var _totalScore = 0;

  final _questionsAsked = const [
    {
      "questionText": "What's your favorite color ?",
      "answers": [
        {'text': 'Blue', 'score': '7'},
        {'text': 'Purple', 'score': '7'},
        {'text': 'Pink', 'score': '2'},
        {'text': 'Red', 'score': '5'}
      ]
    },
    {
      "questionText": "what's your favorite animal ?",
      "answers": [
        {'text': 'Lion', 'score': '4'},
        {'text': 'Dog', 'score': '2'},
        {'text': 'Rabbit', 'score': '7'},
        {'text': 'Lamb', 'score': '5'}
      ]
    },
    {
      "questionText": "who is your favorite flutter instructor ?",
      "answers": [
        {'text': 'Angela', 'score': '5'},
        {'text': 'Maximilian', 'score': '2'},
        {'text': 'Vandad', 'score': '6'},
        {'text': 'James', 'score': '6'}
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade500,
        title: const Text("Dima"),
      ),
      body: _questionsIndex < _questionsAsked.length
          ? Container(
              width: double.infinity,
              color: Colors.brown.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // fakeAppBar(),
                  questions(),
                  const SizedBox(height: 20),
                  answerButtons(),
                ],
              ),
            )
          : Result(
              resultScore: _totalScore,
            ),
    );
  }

  Widget fakeAppBar() {
    return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.brown.shade500,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            "Dima",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          )),
        ));
  }

  Widget answerButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...(_questionsAsked[_questionsIndex]["answers"]
                as List<Map<String, Object>>)
            .map((answers) {
          return ButtonWidget(
            selectHandler: rightAnswer(answers['score'] as int),
            answerText: answers['text'].toString(),
          );
        }).toList(),
      ],
    );
  }

  Widget questions() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.brown.shade100,
        ),
        child: Center(
          child: Text(
            _questionsAsked[_questionsIndex]["questionText"].toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  rightAnswer(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
  }
}

// 'Score' from the map above give Object error, done
//  and a getter is to be set for score calculation <to do>
// learn to leave comments