import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/quiz/quiz_state.dart';
import 'package:quiz_app/services/firestore.dart';
import 'package:quiz_app/shared/progress_bar.dart';

import '../services/models.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key, required this.quizId}) : super(key: key);
  final String quizId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizState(),
      child: FutureBuilder<Quiz>(
        future: FirestoreService().getQuiz(quizId),
        builder: (context, snapshot) {
          var state = Provider.of<QuizState>(context);

          if (!snapshot.hasData || snapshot.hasError) {
            return Loader();
          } else {
            var quiz = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: AnimatedProgressBar(value: state.progress),
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.xmark),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
