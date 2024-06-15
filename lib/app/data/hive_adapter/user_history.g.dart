// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHistoryAdapter extends TypeAdapter<UserHistory> {
  @override
  final int typeId = 1;

  @override
  UserHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHistory(
      timestamp: fields[0] as DateTime,
      action: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.action);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
