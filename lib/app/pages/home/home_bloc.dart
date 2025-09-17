import 'package:adm_todolist/data/datasource/TaskDataSource.dart';
import 'package:adm_todolist/data/datasource/TaskDatasource.dart';
import 'package:adm_todolist/data/model/error_model.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:adm_todolist/data/repository/task_repository.dart';
import 'package:adm_todolist/app/pages/home/home_event.dart';
import 'package:adm_todolist/app/pages/home/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final taskRepository = TaskRepository(TaskDatasource());
        List<TaskModel> tasks = await taskRepository.findAll();
        emit(HomeSuccessState(taskModel: tasks));
      } catch (e) {
        emit(HomeErrorState(errorModel: ErrorModel.empty()));
      }
    });
  }
}
