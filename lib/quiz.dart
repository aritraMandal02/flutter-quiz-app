import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void addAnswers(answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          selectedAnswers: selectedAnswers,
          restart: restartQuiz,
        );
        selectedAnswers = [];
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onAnswer: addAnswers);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 111, 26, 205),
                Color.fromARGB(255, 60, 15, 111),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
