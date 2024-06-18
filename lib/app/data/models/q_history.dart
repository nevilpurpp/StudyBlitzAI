import '../hive_adapter/quiz_history.dart';

class QuizHistory {
  final List<QuizQuestion> questions;
  final List<UserAnswer> answers;

  QuizHistory({required this.questions, required this.answers});
}