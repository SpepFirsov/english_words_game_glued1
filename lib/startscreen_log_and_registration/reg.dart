import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/screen_size.dart';
import 'package:english_words_game/routes/routes.dart';




class Reg_Screen extends StatelessWidget{
  const Reg_Screen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Регистрация')),

      body: Center(
        child: Container( 
          height: 275,
          width: 365,
          alignment: Alignment.center,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children:<Widget>[
        TextField
        (decoration: InputDecoration(
          border: OutlineInputBorder(),hintText: "Никнейм",
          helperText: "Ваше отображаемое имя"),maxLength: 45,
            onChanged: (String value) {
            // ignore: unused_local_variable, non_constant_identifier_names

          },
        ),
        TextField
        (decoration: InputDecoration(
          border: OutlineInputBorder(),hintText: "Логин",
          helperText: "Логин используется для входа в систему"),
          maxLength: 45,
          onChanged: (String value) {
            // ignore: non_constant_identifier_names

          },
        ),
         TextField
        (decoration: InputDecoration(
          border: OutlineInputBorder(),hintText: "Пароль",
          helperText: "Придумайте надёжный пароль"),maxLength: 45,
          obscureText: true,
          onChanged: (String value) {
            // ignore: non_constant_identifier_names
          }
        ),
        

         Container(
            height: 35,
            width: 180,
            alignment: Alignment.bottomCenter,
        child: TextButton(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),foregroundColor: Colors.grey),
          onPressed: () {
             Navigator.pushNamed(context, AppRoutes.start);            
          },
          child:  Container(
            height: 35,
            width: 180,
            alignment: Alignment.center,
            child: Text("Продолжить"),
          )
        )



          )
         ]

        ),
       )
      )
    );

  }
}

