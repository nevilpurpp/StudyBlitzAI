import 'package:hive/hive.dart';
part 'quiz_history.g.dart';

@HiveType(typeId: 3)
class QuizQuestion extends HiveObject {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final String answer;

  @HiveField(2)
  final List<String> incorrectAnswers;

  QuizQuestion(this.question, this.answer, {required this.incorrectAnswers});

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      json['question'],
      json['answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers'] ?? []),
    );
  }
}

@HiveType(typeId: 4)
class UserAnswer {
  @HiveField(0)
  final int questionIndex;

  @HiveField(1)
  final String? selectedAnswer;

  UserAnswer(this.questionIndex, this.selectedAnswer);
}

@HiveType(typeId: 5)
class QuizHistory extends HiveObject {
  @HiveField(0)
  final List<QuizQuestion> questions;

  @HiveField(1)
  final List<UserAnswer> answers;

  QuizHistory({required this.questions, required this.answers});
}
