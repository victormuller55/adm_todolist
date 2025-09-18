import 'package:adm_todolist/app/pages/form_task/form_task_page.dart';
import 'package:adm_todolist/app/pages/home/home_bloc.dart';
import 'package:adm_todolist/app/pages/home/home_event.dart';
import 'package:adm_todolist/app/pages/home/home_state.dart';
import 'package:adm_todolist/app/widgets/modal.dart';
import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/sized_box.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:adm_todolist/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.add(HomeLoadEvent());
    super.initState();
  }

  void _onChangeState(HomeState state) {
    if (state is HomeDeleteSuccessState) {
      showSnackBar(context, text: 'Tarefa apagada com sucesso!');
    }
  }

  void _onPressedEditar(TaskModel task) {
    open(
      context,
      page: FormTaskPage(taskModel: task, homeBloc: _bloc),
    );
  }

  void _onPressedAddTask() {
    open(context, page: FormTaskPage(homeBloc: _bloc));
  }

  void _onChangeStatus(TaskModel task) {
    task.status = !task.status;
    _bloc.add(HomeAddUpdateEvent(taskModel: task));
  }

  void _onDeleteTask(int id) {
    _bloc.add(HomeDeleteEvent(id: id));
  }

  void showModelDelete(int id) {
    showModal(
      context,
      title: 'Apagar Tarefa',
      description: 'Você tem certeza que deseja apagar essa tarefa? essa ação não pode se desfeita!',
      titleButtonConfirm: 'Apagar',
      actionButtonConfirm: () => _onDeleteTask(id),
    );
  }

  Widget _nenhumItemEncontrado() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_rounded, size: 40),
          appSizedBox(height: 5),
          appText('Nenhuma tarefa encontrada.'),
        ],
      ),
    );
  }

  Widget _headerCard(TaskModel task) {
    return Row(
      children: [
        appText(task.title, color: Colors.grey.shade900, fontSize: 24),
        Spacer(),
        IconButton(
          onPressed: () => showModelDelete(task.id),
          icon: Icon(Icons.delete, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  Widget _footerCard(TaskModel task, void Function(bool? value) onChangeStatus) {
    return Row(
      children: [
        Checkbox(value: task.status, onChanged: onChangeStatus),
        appText('Concluido'),
        Spacer(),
        ElevatedButton(
          onPressed: () => _onPressedEditar(task),
          child: appText('Editar', bold: true),
        ),
      ],
    );
  }

  Widget _card(TaskModel task) {
    return StatefulBuilder(
      builder: (context, setState) {

        void changeStatus(bool? value) {
          _onChangeStatus(task);
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerCard(task),
                Divider(),
                appSizedBox(height: 10),
                appText(task.description, color: Colors.grey.shade600),
                appSizedBox(height: 10),
                _footerCard(task, (value) => changeStatus(value)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _body(List<TaskModel> tasks) {
    List<Widget> items = [];

    for (TaskModel task in tasks) {
      items.add(_card(task));
    }

    if (items.isEmpty) {
      return _nenhumItemEncontrado();
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(children: items),
    );
  }

  Widget _bodyBuilder() {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) => _onChangeState(state),
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return Center(child: CircularProgressIndicator());
          default:
            return _body(state.taskList);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      context,
      title: 'Tarefas para fazer',
      body: _bodyBuilder(),
      action: IconButton(
        onPressed: () => {},
        icon: Icon(Icons.settings, color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onPressedAddTask(),
        backgroundColor: AppColors.getSecondaryColor(context),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
