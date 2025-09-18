import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/model/task_model.dart';

abstract class TaskState {
  ErrorModel errorModel;
  List<TaskModel> taskList;

  TaskState({required this.taskList, required this.errorModel});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(taskList: List.empty(), errorModel: ErrorModel.empty());
}

class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(taskList: List.empty(), errorModel: ErrorModel.empty());
}

class TaskSuccessState extends TaskState {
  TaskSuccessState({required super.taskList}) : super(errorModel: ErrorModel.empty());
}

class TaskDeleteSuccessState extends TaskState {
  TaskDeleteSuccessState({required super.taskList}) : super(errorModel: ErrorModel.empty());
}

class TaskErrorState extends TaskState {
  TaskErrorState({required super.errorModel}) : super(taskList: List.empty());
}
