import 'package:adm_todolist/data/model/task_model.dart';

abstract class HomeEvent {}

class TaskLoadEvent extends HomeEvent {}

class TaskAddUpdateEvent extends HomeEvent {
  TaskModel taskModel;
  TaskAddUpdateEvent({required this.taskModel});
}

class TaskDeleteEvent extends HomeEvent {
  int id;
  TaskDeleteEvent({required this.id});
}