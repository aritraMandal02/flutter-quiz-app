import 'package:flutter/material.dart';
import 'package:quiz_app/custom_widgets/custom_buttons.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswer});

  final Function onAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;

  void nextQuestion(answer) {
    widget.onAnswer(answer);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[index].question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...questions[index].getShuffledAnswers().map(
                  (answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        nextQuestion(answer);
                      }),
                ),
          ],
        ),
      ),
    );
  }
}
