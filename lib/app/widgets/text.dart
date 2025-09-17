import 'package:flutter/material.dart';

Widget appText(
  String text, {
  Color? color,
  double? fontSize,
  bool? overflow,
  bool? bold,
  int? maxLines,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      overflow: overflow ?? false ? TextOverflow.ellipsis : null,
      fontWeight: bold ?? false ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
