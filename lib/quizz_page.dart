import 'package:flutter/material.dart'; // Import the Flutter material library.
import 'package:quizzler/quizz_brain.dart'; // Import the 'quizz_brain' module.
import 'package:rflutter_alert/rflutter_alert.dart'; // Import the 'rflutter_alert' module for showing alerts.

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() =>
      _QuizzlerState(); // Define the state for the Quizzler widget.
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> iconsAnswers =
      []; // Create a list to store answer icons. Creation de la liste d'icons
  int goodAnswer = 0; // Initialize the count of correct answers to 0.

  QuizzBrain quizzBrain =
      QuizzBrain(); // Create an instance of the QuizzBrain class.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black, // Set the background color to black.
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
                      quizzBrain
                          .getQuestion(), // Get the current question from the QuizzBrain. Recupére la position du question
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
                  color: Colors.green, // Set the card color to green.
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(
                          true); // Call the checkAnswer method with a 'true' argument. // On envoie Vraie comme reponse à la fonction checkAnswer
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
                      checkAnswer(
                          false); // Call the checkAnswer method with a 'false' argument. On envoie Fause comme reponse à la fonction checkAnswer
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
                    children:
                        iconsAnswers, // Display the answer icons. Pour Afficher les Icones
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
          title: "Finshed", // Display the quiz completion message.
          desc: goodAnswer > 6
              ? "Well Done it Seems like you know Flutter" // Display a success message.
              : "Try Again Dude", // Display a failure message.
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  quizzBrain.reset(); // Reset the quiz.
                  iconsAnswers = []; // Clear the answer icons.
                  goodAnswer = 0; // Reset the correct answer count.
                });
                Navigator.pop(context); // Close the alert.
              },
              width: 120,
              child: const Text(
                "RePlay", // Display a "RePlay" button.
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20), // Define the button style.
              ),
            )
          ],
        ).show();
      } else {
        bool correctAnswer = quizzBrain
            .getAnswer(); // Get the correct answer. Recupére la bonne réponse

        if (correctAnswer == userAnswer) {
          // On verifie si le choix d'utilisateur correspond à la bonne réponse
          iconsAnswers.add(const Icon(Icons.check,
              color: Colors
                  .green)); // Add a checkmark icon for a correct answer.  Si reponse correct on ajoute une icon verte
          goodAnswer++; // Increment the correct answer count.
        } else {
          iconsAnswers.add(const Icon(Icons.close,
              color: Colors
                  .red)); // Add a close icon for an incorrect answer.  Si reponse fausse on ajoute une icon rouge
        }
        quizzBrain
            .nextQuestion(); // Move to the next question. pour se deplacer vers la question suivante
      }
    });
  }
}
