import 'package:adm_todolist/app/bloc/task_bloc.dart';
import 'package:adm_todolist/app/bloc/task_event.dart';
import 'package:adm_todolist/app/bloc/task_state.dart';
import 'package:adm_todolist/app/pages/form_task/form_task_page.dart';
import 'package:adm_todolist/app/pages/settings/settings_page.dart';
import 'package:adm_todolist/app/widgets/modal.dart';
import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/sized_box.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/data/datasource/task_data_dource.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:adm_todolist/data/repository/task_repository.dart';
import 'package:adm_todolist/functions/functions.dart';
import 'package:adm_todolist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskPage extends StatefulWidget {
  final void Function(bool) onChangeDarkMode;
  final void Function(String) onChangeLanguage;
  final String currentLanguage;
  final bool isDarkMode;

  const TaskPage({
    super.key,
    required this.onChangeDarkMode,
    required this.onChangeLanguage,
    required this.currentLanguage,
    required this.isDarkMode,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  final _bloc = TaskBloc(TaskRepository(TaskDataSource()));

  @override
  void initState() {
    _bloc.add(TaskLoadEvent());
    super.initState();
  }

  void _onChangeState(TaskState state) {
    if (state is TaskDeleteSuccessState) {
      showSnackBar(context, text: S.of(context).taskDeletedSuccessfully);
    }
  }

  void _onPressedEditar(TaskModel task) {
    open(
      context,
      page: FormTaskPage(taskModel: task, taskBloc: _bloc),
    );
  }

  void _onPressedAddTask() {
    open(context, page: FormTaskPage(taskBloc: _bloc));
  }

  void _onChangeStatus(TaskModel task) {
    task.status = !task.status;
    _bloc.add(TaskAddUpdateEvent(task: task));
  }

  void _onDeleteTask(int id) {
    _bloc.add(TaskDeleteEvent(id: id));
  }

  void showModelDelete(int id) {
    showModal(
      context,
      title: S.of(context).deleteTask,
      colorButtonConfirm: Colors.red,
      description: S.of(context).deleteTaskDescription,
      titleButtonConfirm: S.of(context).delete,
      actionButtonConfirm: () => _onDeleteTask(id),
    );
  }

  Widget _nenhumItemEncontrado() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            _infoTarefas(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_rounded, size: 40),
                  appSizedBox(height: 5),
                  appText(S.of(context).noTasksFound),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCard(TaskModel task, void Function() onChangeStatus) {
    return Row(
      children: [
        Expanded(child: appText(task.title, fontSize: 20, overflow: true)),
        appSizedBox(width: 20),
        SizedBox(
          child: ActionChip(
            onPressed: onChangeStatus,
            avatar: Icon(
              task.status ? Icons.check_box : Icons.access_time_outlined,
              color: task.status ? Colors.white : Colors.grey.shade600,
            ),
            label: appText(
              task.status ? S.of(context).completed : S.of(context).pending,
              color:
                  Theme.of(context).brightness == Brightness.light && !task.status
                  ? Colors.grey.shade700
                  : Colors.white,
            ),
            color: WidgetStateProperty.all(
              task.status ? Colors.green : Theme.of(context).cardColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerCard(TaskModel task) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 10,
      children: [
        TextButton(
          onPressed: () => showModelDelete(task.id),
          child: appText(S.of(context).delete, bold: true, color: AppColors.getTextColor(context)),
        ),
        ElevatedButton(
          onPressed: () => _onPressedEditar(task),
          child: appText(S.of(context).edit, bold: true, color: AppColors.getTextColor(context)),
        ),
      ],
    );
  }

  Widget _card(TaskModel task) {
    return StatefulBuilder(
      builder: (context, setState) {
        void changeStatus() {
          _onChangeStatus(task);
        }

        return Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerCard(task, () => changeStatus()),
                Divider(),
                appText(task.description, color: Colors.grey.shade600),
                appSizedBox(height: 20),
                _footerCard(task),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _infoTarefas() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: appText(
          S.of(context).taskInfoDescriptionPage,
          textAlign: TextAlign.center,
        ),
      ),
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

    return ListView(children: [_infoTarefas(), ...items]);
  }

  Widget _bodyBuilder() {
    return BlocConsumer<TaskBloc, TaskState>(
      bloc: _bloc,
      listener: (context, state) => _onChangeState(state),
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (TaskLoadingState):
            return Center(child: CircularProgressIndicator());
          default:
            return _body(state.taskList);
        }
      },
    );
  }

  Widget _floatingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton.extended(
          key: const Key('openNewTask'),
          heroTag: 'floating-page',
          onPressed: () => _onPressedAddTask(),
          backgroundColor: AppColors.getSecondaryColor(context),
          label: Row(
            children: [
              appText(S.of(context).newTask, color: Colors.white),
              appSizedBox(width: 10),
              Icon(Icons.add, color: Colors.white),
            ],
          ),
        ),
        appSizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => open(
            context,
            page: SettingsPage(
              onThemeChanged: widget.onChangeDarkMode,
              onLanguageChanged: widget.onChangeLanguage,
              isDarkMode: widget.isDarkMode,
              currentLanguage: widget.currentLanguage,
            ),
          ),
          backgroundColor: AppColors.getSecondaryColor(context),
          child: Icon(Icons.settings, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      context,
      title: S.of(context).tasksToDo,
      body: _bodyBuilder(),
      floatingActionButton: _floatingButtons(),
    );
  }
}
