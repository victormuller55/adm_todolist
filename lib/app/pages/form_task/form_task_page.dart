import 'package:adm_todolist/app/pages/home/home_bloc.dart';
import 'package:adm_todolist/app/pages/home/home_event.dart';
import 'package:adm_todolist/app/pages/home/home_page.dart';
import 'package:adm_todolist/app/pages/home/home_state.dart';
import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

class FormTaskPage extends StatefulWidget {
  final TaskModel? taskModel;
  final HomeBloc homeBloc;

  const FormTaskPage({super.key, required this.homeBloc, this.taskModel});

  @override
  State<FormTaskPage> createState() => _FormTaskPageState();
}

class _FormTaskPageState extends State<FormTaskPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  void _errorFeedback() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(pattern: [0, 50, 50, 50, 50, 50]);
    }
  }

  @override
  void initState() {
    super.initState();

    if(widget.taskModel != null) {
      titleController.text = widget.taskModel!.title;
      descricaoController.text = widget.taskModel!.description;
    }

  }

  void _onChangeState(HomeState state) {
    if(state is HomeSuccessState) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tarefa cadastrada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
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

      widget.homeBloc.add(HomeAddUpdateEvent(taskModel: taskModel));
    } else {
      _errorFeedback();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos obrigatórios'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              decoration: InputDecoration(
                label: appText('Titulo da Tarefa'),
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descricaoController,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              decoration: InputDecoration(
                label: appText('Descrição da Tarefa'),
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _save(),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(double.infinity, 50),
                backgroundColor: AppColors.getPrimaryColor(context),
              ),
              child: appText(
                'Salvar Tarefa'.toUpperCase(),
                color: Colors.white,
                bold: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyBuilder() {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: widget.homeBloc,
      listener: (context, state) => _onChangeState(state),
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return CircularProgressIndicator();
          default:
            return _body();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(context, title: 'Cadastrar Novo', body: _bodyBuilder());
  }
}
