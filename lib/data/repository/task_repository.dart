import 'dart:math';

import 'package:adm_todolist/data/datasource/task_data_dource.dart';

import '../model/task_model.dart';

class TaskRepository {

  int _generateID(Set<int> existingIds) {
    final random = Random();
    int id;

    do {
      id = random.nextInt(1_000_001);
    } while (existingIds.contains(id));

    return id;
  }

  final TaskDataSource localDatasource;

  TaskRepository(this.localDatasource);

  Future<List<TaskModel>> findAll() => localDatasource.getTasks();

  Future<void> save(TaskModel task) async {
    if (task.id == 0) {
      final tasks = await localDatasource.getTasks();
      task.id = _generateID(tasks.map((t) => t.id).toSet());
      await localDatasource.addTask(task);
    } else {
      await localDatasource.updateTask(task);
    }
  }

  Future<void> delete(int id) => localDatasource.deleteTask(id);
}
