class QuizQuestion {
  final String question;
  final String answer;
  final List<String> incorrectAnswers;

  QuizQuestion(
    this.question,
    this.answer, 
    {this.incorrectAnswers = const []});
}
