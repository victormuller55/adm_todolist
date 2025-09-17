import 'package:hive/hive.dart';
part 'task_model.g.dart'; // Arquivo que será gerado

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  bool? status;

  TaskModel({this.id, this.title, this.description, this.status});

  factory TaskModel.empty() {
    return TaskModel(id: 0, title: '', description: '', status: false);
  }
}
