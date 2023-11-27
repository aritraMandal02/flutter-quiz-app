import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/custom_widgets/summary_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.restart,
  });

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summary = getSummaryData();
    int score = 0;
    for (Map eachAnswer in summary) {
      if (eachAnswer['correct_answer'] == eachAnswer['user_answer']) {
        score++;
      }
    }
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $score out of ${selectedAnswers.length} questions correctly!',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionsSummary(summary: summary),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: const Text(
              'Restart Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
