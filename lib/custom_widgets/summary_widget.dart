import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summary
                .map((questionData) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 27,
                          width: 27,
                          decoration: BoxDecoration(
                              color: questionData['user_answer'] ==
                                      questionData['correct_answer']
                                  ? Colors.lightBlueAccent
                                  : const Color.fromARGB(255, 255, 113, 113),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              ((questionData['question_index'] as int) + 1)
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${questionData['question']}",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "${questionData['user_answer']}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "${questionData['correct_answer']}",
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5)
                            ],
                          ),
                        )
                      ],
                    ))
                .toList()),
      ),
    );
  }
}
