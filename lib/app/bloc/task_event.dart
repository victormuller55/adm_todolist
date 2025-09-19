import 'package:adm_todolist/data/model/task_model.dart';

abstract class TaskEvent {}

class TaskLoadEvent extends TaskEvent {}

class TaskAddUpdateEvent extends TaskEvent {
  TaskModel task;
  TaskAddUpdateEvent({required this.task});
}

class TaskDeleteEvent extends TaskEvent {
  int id;
  TaskDeleteEvent({required this.id});
}