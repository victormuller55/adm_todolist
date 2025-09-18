import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/model/task_model.dart';

abstract class HomeState {
  ErrorModel errorModel;
  List<TaskModel> taskList;

  HomeState({required this.taskList, required this.errorModel});
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(taskList: List.empty(), errorModel: ErrorModel.empty());
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super(taskList: List.empty(), errorModel: ErrorModel.empty());
}

class HomeSuccessState extends HomeState {
  HomeSuccessState({required super.taskList}) : super(errorModel: ErrorModel.empty());
}

class HomeDeleteSuccessState extends HomeState {
  HomeDeleteSuccessState({required super.taskList}) : super(errorModel: ErrorModel.empty());
}

class HomeErrorState extends HomeState {
  HomeErrorState({required super.errorModel}) : super(taskList: List.empty());
}
