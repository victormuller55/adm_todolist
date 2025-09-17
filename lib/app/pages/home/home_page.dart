import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/app/pages/form_task/form_task_page.dart';
import 'package:adm_todolist/app/widgets/modal.dart';
import 'package:adm_todolist/app/widgets/scaffold.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _card() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                appText(
                  'Titulo da tarefa',
                  color: Colors.grey.shade900,
                  fontSize: 24,
                ),
                Spacer(),
                IconButton(
                  onPressed: () => showModal(
                    context,
                    title: 'Apagar Tarefa',
                    description:
                        'Você tem certeza que deseja apagar essa tarefa? essa ação não pode se desfeita!',
                    titleButtonConfirm: 'Apagar',
                    actionButtonConfirm: () => {},
                  ),
                  icon: Icon(Icons.delete, color: Colors.grey.shade700),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 10),
            appText('Titulo da tarefa', color: Colors.grey.shade600),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) => {}),
                appText('Concluido'),
                Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormTaskPage()),
                  ),
                  child: Text('Editar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(children: [_card()]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(
      context,
      title: 'Tarefas para fazer',
      body: _body(),
      action: IconButton(
        onPressed: () => {},
        icon: Icon(Icons.settings, color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FormTaskPage()),
        ),
        backgroundColor: AppColors.getSecondaryColor(context),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
