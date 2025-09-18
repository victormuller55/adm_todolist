import 'package:adm_todolist/app/bloc/task_event.dart';
import 'package:adm_todolist/app/bloc/task_state.dart';
import 'package:adm_todolist/data/datasource/task_data_dource.dart';
import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:adm_todolist/data/repository/task_repository.dart';
import 'package:bloc/bloc.dart';

class TaskBloc extends Bloc<HomeEvent, TaskState> {
  TaskBloc() : super(TaskInitialState()) {

    final taskRepository = TaskRepository(TaskDataSource());

    on<TaskLoadEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(TaskSuccessState(taskList: tasks));
      } catch (e) {
        emit(TaskErrorState(errorModel: ErrorModel.empty()));
      }
    });

    on<TaskAddUpdateEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        await taskRepository.save(event.taskModel);
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(TaskSuccessState(taskList: tasks));
      } catch (e) {
        emit(TaskErrorState(errorModel: ErrorModel.empty()));
      }
    });

    on<TaskDeleteEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        await taskRepository.delete(event.id);
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(TaskDeleteSuccessState(taskList: tasks));
      } catch (e) {
        emit(TaskErrorState(errorModel: ErrorModel.empty()));
      }
    });
  }
}
