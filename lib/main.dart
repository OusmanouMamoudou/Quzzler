// Le code définit une application Flutter avec le point d'entrée principal dans la fonction main.
// La classe MyApp représente l'application principale et est un widget sans état.
// La classe MyApp définie le titre de l'application comme étant 'Quizzler' et définit son thème avec une couleur primaire noire.
// Le widget Quizzler est défini comme la page d'accueil initiale de l'application.

import 'package:flutter/material.dart'; // Import the Flutter material library.
import 'package:quizzler/quizz_page.dart'; // Import the 'quizz_page' module.

void main() {
  runApp(const MyApp()); // Run the app and start with the 'MyApp' widget.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner.
      title: 'Quizzler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black, // Set the primary color to black.
        ),
        useMaterial3: true,
      ),
      home: const Quizzler(), // Set the home page to the 'Quizzler' widget.
    );
  }
}
