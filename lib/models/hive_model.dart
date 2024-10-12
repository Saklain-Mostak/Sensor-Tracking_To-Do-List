
import 'package:hive_flutter/adapters.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String details;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  DateTime dueDate;

  Task({
    required this.title,
    required this.details,
    this.isCompleted = false,
    required this.dueDate,
  });
}
