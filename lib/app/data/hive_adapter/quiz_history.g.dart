// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizQuestionAdapter extends TypeAdapter<QuizQuestion> {
  @override
  final int typeId = 3;

  @override
  QuizQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizQuestion(
      fields[0] as String,
      fields[1] as String,
      incorrectAnswers: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizQuestion obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(2)
      ..write(obj.incorrectAnswers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAnswerAdapter extends TypeAdapter<UserAnswer> {
  @override
  final int typeId = 4;

  @override
  UserAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAnswer(
      fields[0] as int,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAnswer obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questionIndex)
      ..writeByte(1)
      ..write(obj.selectedAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuizHistoryAdapter extends TypeAdapter<QuizHistory> {
  @override
  final int typeId = 5;

  @override
  QuizHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizHistory(
      questions: (fields[0] as List).cast<QuizQuestion>(),
      answers: (fields[1] as List).cast<UserAnswer>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questions)
      ..writeByte(1)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
