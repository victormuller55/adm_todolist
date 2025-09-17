import 'package:adm_todolist/data/datasource/TaskDataSource.dart';

import '../model/task_model.dart';

class TaskRepository {

  final TaskDatasource localDatasource;

  TaskRepository(this.localDatasource);

  Future<List<TaskModel>> findAll() => localDatasource.getTasks();
  Future<void> save(TaskModel task) => localDatasource.addTask(task);
  Future<void> update(TaskModel task) => localDatasource.updateTask(task);
  Future<void> delete(String id) => localDatasource.deleteTask(id);
}
