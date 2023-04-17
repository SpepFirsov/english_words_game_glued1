import 'package:flutter/material.dart';

Widget PopButton(BuildContext context, {Function? func}) {
  return IconButton(onPressed: () {
    if (func == null) {
      Navigator.pop(context);
    } else {
      func();
    }
  }, icon: const Icon(Icons.arrow_back, size: 30,));
}