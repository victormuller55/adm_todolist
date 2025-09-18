import 'package:adm_todolist/app/widgets/text.dart';
import 'package:flutter/material.dart';

void open(BuildContext context, {required Widget page, bool? closePrevious}) {
  if (closePrevious ?? false) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

void showSnackBar(BuildContext context, {required String text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: appText(text), backgroundColor: color ?? Colors.green),
  );
}
