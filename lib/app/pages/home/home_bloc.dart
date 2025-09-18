import 'package:adm_todolist/app/pages/home/home_event.dart';
import 'package:adm_todolist/app/pages/home/home_state.dart';
import 'package:adm_todolist/data/datasource/task_data_dource.dart';
import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:adm_todolist/data/repository/task_repository.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {

    final taskRepository = TaskRepository(TaskDataSource());

    on<HomeLoadEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(HomeSuccessState(taskList: tasks));
      } catch (e) {
        emit(HomeErrorState(errorModel: ErrorModel.empty()));
      }
    });

    on<HomeAddUpdateEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        await taskRepository.save(event.taskModel);
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(HomeSuccessState(taskList: tasks));
      } catch (e) {
        emit(HomeErrorState(errorModel: ErrorModel.empty()));
      }
    });

    on<HomeDeleteEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        await taskRepository.delete(event.id);
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(HomeDeleteSuccessState(taskList: tasks));
      } catch (e) {
        emit(HomeErrorState(errorModel: ErrorModel.empty()));
      }
    });
  }
}
