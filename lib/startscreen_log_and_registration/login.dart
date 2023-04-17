import 'package:english_words_game/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/screen_size.dart';


class Login_Screen extends StatelessWidget{  

  const Login_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;
    // ignore: unused_label
    resizeToAvoidBottomInset:false;
      late String _pass;
  late String _login;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Вход')),

      body: Center(
        child: Container( //<- контейнер с двумя кнопками
          height: 250,
          width: 365,
          alignment: Alignment.center,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children:<Widget>[
          
        TextField
        (decoration: InputDecoration(
          border: OutlineInputBorder(),hintText: "Логин",
          helperText: "Логин"),maxLength: 45,
          onChanged: (String value) {
            // ignore: non_constant_identifier_names
            _login = value;
          }
        ),
        TextField
        (decoration: InputDecoration(
          border: OutlineInputBorder(),hintText: "Пароль",
          helperText: "Пароль",),maxLength: 45,
          obscureText: true,
          onChanged: (String value) {
            // ignore: non_constant_identifier_names
            _pass = value;
          }
          
        ),

        

         Container(
            height: 35,
            width: 180,
            alignment: Alignment.center,color: Colors.white,
        child: TextButton( 
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),foregroundColor: Colors.grey),
          onPressed: () 
          {
            if((_pass == "1111")&(_login=="user")) {
            Navigator.pushNamed(context, AppRoutes.home); 
         }
         else{
          Future simpleDialog(BuildContext context) { ///в хромтесте окна не было я хз будет ли окно вылетать ваще
          return showDialog(
          context: context,
          builder: (BuildContext context) {
          return AlertDialog(
          title: Text('Ошибка'),
          content: Text('Неправильный логин или пароль'), 
          actions: <Widget>[
          TextButton(
          child: Text('Ок'),
          onPressed: () {
          Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
 }
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
