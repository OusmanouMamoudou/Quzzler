import 'package:quizzler/question.dart';

class QuizzBrain {
  int _questionNumber = 0;

  final List<Question> _questions = [
    Question(
      question: "Flutter is an open-source UI toolkit ?",
      answer: true,
      infos: "Flutter is an open-source UI toolkit for creating"
          " exceptional front-end cross-platform applications.",
    ),
    Question(
      question: "Flutter is developed by Facebook ?",
      answer: false,
      infos: "Google began developing Flutter back in 2015 and supports its"
          " continued development and maintenance today alongside a highly"
          " active open-source community.",
    ),
    Question(
      question: "Flutter programs are written in Dart programming language ?",
      answer: true,
      infos:
          "Flutter programs are written in Google's own Dart programming language.",
    ),
    Question(
      question: "Flutter has 3 types of Widgets ?",
      answer: false,
      infos: "There are two types of widgets available to"
          " developers in Flutter. These are stateful and stateless widgets.",
    ),
    Question(
      question:
          "Flutter is restricted to an AOT(ahead Of Time) compilation strategy ?",
      answer: true,
      infos: "Due to iOS restrictions on dynamic code execution"
          " Flutter apps must use AOT compilation on the iOS platform.",
    ),
    Question(
      question: "A sequence of asynchronous Flutter events is known as a Flow",
      answer: false,
      infos:
          "A sequence of asynchronous events is often referred to as a stream.",
    ),
    Question(
      question:
          "Access to a cloud database through Flutter is available through MySql?",
      answer: false,
      infos: "Firebase database allows for access to"
          " a cloud-based database provider for Flutter applications",
    ),
    Question(
      question:
          "Key is used as an identifier for components when programming in Flutter?",
      answer: true,
      infos:
          "Keys are used in Flutter to uniquely identify widgets, elements, and SemanticsNodes.",
    ),
    Question(
      question:
          "Flutter boasts improved runtime performance over most application frameworks ?",
      answer: true,
      infos:
          "Flutter indeed boasts exceptional performance credentials when compared to related application frameworks.",
    ),
    Question(
      question:
          "Pubspec.yaml is the key configuration file used when building a Flutter project ?",
      answer: true,
      infos:
          "pubspec.yaml lives at the base of a Flutter project and provides the necessary"
          " configuration and setup to build Flutter apps.",
    ),
  ];

  String getQuestion() {
    return _questions[_questionNumber].question;
  }

  String getInfos() {
    return _questions[_questionNumber].infos;
  }

  bool getAnswer() {
    return _questions[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
