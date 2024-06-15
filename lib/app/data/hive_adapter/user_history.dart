import 'package:hive/hive.dart';

part 'user_history.g.dart';

@HiveType(typeId: 1)
class UserHistory extends HiveObject {
  @HiveField(0)
  final DateTime timestamp;
  
  @HiveField(1)
  final String action;  

  UserHistory({required this.timestamp, required this.action});
}
