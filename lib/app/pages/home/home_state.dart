import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/model/task_model.dart';

abstract class HomeState {
  ErrorModel errorModel;
  List<TaskModel> taskModel;

  HomeState({required this.taskModel, required this.errorModel});
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(taskModel: List.empty(), errorModel: ErrorModel.empty());
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super(taskModel: List.empty(), errorModel: ErrorModel.empty());
}

class HomeSuccessState extends HomeState {
  HomeSuccessState({required super.taskModel}) : super(errorModel: ErrorModel.empty());
}

class HomeErrorState extends HomeState {
  HomeErrorState({required super.errorModel}) : super(taskModel: List.empty());
}
