import 'package:adm_todolist/const/colors.dart';
import 'package:adm_todolist/app/widgets/text.dart';
import 'package:flutter/material.dart';

Widget appScaffold(
  BuildContext context, {
  required String title,
  required Widget body,
  Widget? action,
  Widget? floatingActionButton,
}) {
  return Scaffold(
    body: body,
    floatingActionButton: floatingActionButton,
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: AppColors.getPrimaryColor(context),
      actions: action != null ? [action] : null,
      title: appText(
        title.toUpperCase(),
        color: Colors.white,
        bold: true,
        fontSize: 15,
      ),
    ),
  );
}
