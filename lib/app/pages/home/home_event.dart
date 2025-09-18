import 'package:adm_todolist/data/model/task_model.dart';

abstract class HomeEvent {}

class HomeLoadEvent extends HomeEvent {}

class HomeAddUpdateEvent extends HomeEvent {
  TaskModel taskModel;
  HomeAddUpdateEvent({required this.taskModel});
}

class HomeDeleteEvent extends HomeEvent {
  int id;
  HomeDeleteEvent({required this.id});
}