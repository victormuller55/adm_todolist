import 'package:adm_todolist/app/bloc/task_event.dart';
import 'package:adm_todolist/app/bloc/task_state.dart';
import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/repository/task_repository.dart';
import 'package:bloc/bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskInitialState()) {

    on<TaskLoadEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        final tasks = await taskRepository.findAll();
        emit(TaskSuccessState(taskList: tasks));
      } catch (e) {
        emit(TaskErrorState(errorModel: ErrorModel.empty()));
      }
    });

    on<TaskAddUpdateEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        await taskRepository.save(event.task);
        final tasks = await taskRepository.findAll();
        emit(TaskSuccessState(taskList: tasks));
      } catch (e) {
        emit(TaskErrorState(errorModel: ErrorModel.empty()));
      }
    });

    on<TaskDeleteEvent>((event, emit) async {
      emit(TaskLoadingState());
      try {
        await taskRepository.delete(event.id);
        final tasks = await taskRepository.findAll();
        emit(TaskDeleteSuccessState(taskList: tasks));
      } catch (e) {
        emit(TaskErrorState(errorModel: ErrorModel.empty()));
      }
    });
  }
}
