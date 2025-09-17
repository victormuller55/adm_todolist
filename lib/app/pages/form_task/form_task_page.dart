import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:flutter/material.dart';

class FormTaskPage extends StatefulWidget {
  const FormTaskPage({super.key});

  @override
  State<FormTaskPage> createState() => _FormTaskPageState();
}

class _FormTaskPageState extends State<FormTaskPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(
              label: appText('Titulo da Tarefa'),
              filled: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _descricaoController,
            maxLines: 5,
            decoration: InputDecoration(
              label: appText('Titulo da Tarefa'),
              filled: true,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity, 50),
              backgroundColor: AppColors.getPrimaryColor(context),
            ),
            child: appText('Salvar Tarefa'.toUpperCase(), color: Colors.white, bold: true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(context, title: 'Cadastrar Novo', body: _body());
  }
}
