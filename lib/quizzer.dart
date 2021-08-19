import 'package:quiz_app/prompt.dart';

class Quizzer {
  int _questionNum = 0;

  List<Prompt> _questionList = [
    Prompt('Some cats are actually allergic to humans', true),
    Prompt('You can lead a cow down stairs but not up stairs.', false),
    Prompt('Approximately one quarter of human bones are in the feet.', true),
    Prompt('A slug\'s blood is green.', true),
    Prompt('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Prompt('It is illegal to pee in the Ocean in Portugal.', true),
    Prompt(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Prompt(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Prompt(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Prompt(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Prompt('Google was originally called \"Backrub\".', true),
    Prompt(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Prompt(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  Quizzer();

  String getQuestion() {
    return _questionList[_questionNum].getQuestion();
  }

  bool getAnswer() {
    return _questionList[_questionNum].getAnswer();
  }

  void nextQuestion() {
    if (_questionNum < _questionList.length - 1) {
      _questionNum++;
    }
  }

  bool isFinished() {
    if (_questionNum == _questionList.length - 1) {
      return true;
    }
    return false;
  }

  void resetQuestionNum() {
    _questionNum = -1;
  }
}
