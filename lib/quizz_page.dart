import 'package:flutter/material.dart';
import 'package:quizzler/quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> iconsAnswers = [];
  int goodAnswer = 0;

  QuizzBrain quizzBrain = QuizzBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      quizzBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: const Text(
                      'True',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: const Text(
                      'False',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Row(
                    children: iconsAnswers,
                  ),
                ),
              )
            ]));
  }

  void checkAnswer(userAnswer) {
    setState(() {
      if (quizzBrain.isFinished() == true) {
        Alert(
          context: context,
          type: goodAnswer > 6 ? AlertType.success : AlertType.error,
          title: "Finshed",
          desc: goodAnswer > 6
              ? "Well Done it Seems like you know Flutter"
              : "Try Again Dude",
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  quizzBrain.reset();
                  iconsAnswers = [];
                  goodAnswer = 0;
                });
                Navigator.pop(context);
              },
              width: 120,
              child: const Text(
                "RePlay",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      } else {
        bool correctAnswer = quizzBrain.getAnswer();

        if (correctAnswer == userAnswer) {
          iconsAnswers.add(const Icon(Icons.check, color: Colors.green));

          goodAnswer++;
        } else {
          iconsAnswers.add(const Icon(Icons.close, color: Colors.red));
        }
        quizzBrain.nextQuestion();
      }
    });
  }
}
