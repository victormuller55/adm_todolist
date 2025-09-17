import 'package:adm_todolist/app/widgets/text.dart';
import 'package:flutter/material.dart';

void showModal(
  BuildContext context, {
  required String title,
  required String description,
  required String titleButtonConfirm,
  required void Function() actionButtonConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: appText(title),
        content: appText(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: appText('Cancelar'),
          ),
          TextButton(
            onPressed: ()  {
              Navigator.pop(context);
              actionButtonConfirm();
            },
            child: appText(titleButtonConfirm),
          ),
        ],
      );
    },
  );
}
