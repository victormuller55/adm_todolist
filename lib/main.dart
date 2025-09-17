import 'package:adm_todolist/app_widget/app_widget.dart';
import 'package:adm_todolist/data/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async  {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  runApp(const MyApp());
}