import 'package:hive/hive.dart';

part 'task_model.g.dart'; // Arquivo que será gerado

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  bool status;

  TaskModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.status = false,
  });

  factory TaskModel.empty() {
    return TaskModel(id: 0, title: '', description: '', status: false);
  }

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: isCompleted ?? status,
    );
  }
}
