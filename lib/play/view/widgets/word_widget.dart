import 'package:flutter/material.dart';

Widget WordWidget (String text, Color color, Color borderColor) {
  return Container(

        height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
      border: Border.all(color: borderColor)
    ),

    child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(text, style: TextStyle(fontSize: 16),)),
  );
}