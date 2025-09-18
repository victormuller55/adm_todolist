import 'package:hive/hive.dart';
import '../model/task_model.dart';

class TaskDataSource {
  final Box<TaskModel> taskBox = Hive.box<TaskModel>('tasks');

  Future<List<TaskModel>> getTasks() async {
    return taskBox.values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> updateTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }

  Future<void> deleteTask(int id) async {
    await taskBox.delete(id);
  }
}
