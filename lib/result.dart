import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore >= 18) {
      resultText = 'Awesome job';
    } else if (resultScore <= 12) {
      resultText = 'Good';
    } else if (resultScore <= 6) {
      resultText = 'Okay';
    } else {
      resultText = 'Fail';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
