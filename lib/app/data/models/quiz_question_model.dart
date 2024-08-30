class QuizQuestion {
  final String question;
  final String answer;
  final List<String> incorrectAnswers;
    

  QuizQuestion({
    required this.question,
    required this.answer,
    required this.incorrectAnswers
    });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      incorrectAnswers: List<String>.from(json['incorrect_answers'] ?? []),
    );
  }
}
