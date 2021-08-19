import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizzer.dart';

Quizzer quizzer = Quizzer();
int correct = 0;
int total = 0;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //Button style
  final ButtonStyle trueButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.green,
    minimumSize: Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
  );
  final ButtonStyle falseButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.red,
    minimumSize: Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
  );

  //The two Icons we will be using
  Icon checkMark = Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon xMark = Icon(
    Icons.clear,
    color: Colors.red,
  );

  void checkAnswer(bool userAnswer) {
    if (quizzer.getAnswer() == userAnswer) {
      scoreKeeper.add(checkMark);
      correct++;
      total++;
    } else {
      scoreKeeper.add(xMark);
      total++;
    }
    if (quizzer.isFinished()) {
      Alert(
              context: context,
              title: "FINISHED",
              desc:
                  "You are completed with this quiz, you scored $correct/$total. Nice!")
          .show();
      quizzer.resetQuestionNum();
      scoreKeeper = [];
      correct = 0;
      total = 0;
    }
    setState(() {
      quizzer.nextQuestion();
    });
  }

  //Row of Icons at the bottom
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzer.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'RobotSlab',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: trueButtonStyle,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: falseButtonStyle,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: [
            Row(
              children: scoreKeeper,
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ],
    );
  }
}
