import 'package:adm_todolist/app/bloc/task_bloc.dart';
import 'package:adm_todolist/app/bloc/task_event.dart';
import 'package:adm_todolist/app/bloc/task_state.dart';
import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/sized_box.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:adm_todolist/functions/functions.dart';
import 'package:adm_todolist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

class FormTaskPage extends StatefulWidget {
  final TaskModel? taskModel;
  final TaskBloc taskBloc;

  const FormTaskPage({super.key, required this.taskBloc, this.taskModel});

  @override
  State<FormTaskPage> createState() => _FormTaskPageState();
}

class _FormTaskPageState extends State<FormTaskPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  void _vibrateError() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(pattern: [0, 50, 50, 50, 50, 50]);
    }
  }

  void _addDataForms() {
    if (widget.taskModel != null) {
      titleController.text = widget.taskModel!.title;
      descricaoController.text = widget.taskModel!.description;
    }
  }

  void _onChangeState(TaskState state) {
    if (state is TaskSuccessState) {
      showSnackBar(context, text: S.of(context).taskSavedSuccessfully);
      Navigator.pop(context);
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      TaskModel taskModel = TaskModel();

      if (widget.taskModel != null) {
        taskModel = widget.taskModel!;
      }

      taskModel.title = titleController.value.text;
      taskModel.description = descricaoController.value.text;

      widget.taskBloc.add(TaskAddUpdateEvent(taskModel: taskModel));
    } else {
      _vibrateError();
      showSnackBar(
        context,
        text: S.of(context).fillAllRequiredFields,
        color: Colors.orange,
      );
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).requiredField;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _addDataForms();
  }

  Widget _formText({
    required TextEditingController controller,
    required String title,
    bool? extended,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      maxLines: extended ?? false ? 5 : null,
      decoration: InputDecoration(
        label: appText(title),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _infoCadastroTarefas() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: appText(
        S.of(context).taskInfoDescriptionForm,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        children: [
          _formText(
            title: S.of(context).taskTitle,
            controller: titleController,
          ),
          _formText(
            title: S.of(context).taskDescription,
            controller: descricaoController,
            extended: true,
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        _infoCadastroTarefas(),
        appSizedBox(height: 10),
        _form(),
        appSizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _save(),
          style: ElevatedButton.styleFrom(
            elevation: 2,
            fixedSize: Size(double.infinity, 50),
            backgroundColor: AppColors.getPrimaryColor(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: appText(
            S.of(context).saveTask,
            color: Colors.white,
            bold: true,
          ),
        ),
      ],
    );
  }

  Widget _bodyBuilder() {
    return BlocConsumer<TaskBloc, TaskState>(
      bloc: widget.taskBloc,
      listener: (context, state) => _onChangeState(state),
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (TaskLoadingState):
            return Center(child: CircularProgressIndicator());
          default:
            return _body();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'floating-page',
      child: appScaffold(
        context,
        title: S.of(context).registerNew,
        body: _bodyBuilder(),
      ),
    );
  }
}
