import 'package:english_words_game/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/screen_size.dart';


class Welcome_Screen extends StatelessWidget {
  
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        
        appBar:AppBar(
        // ignore: prefer_const_constructors
        title:Text('game'), //gengogame
        centerTitle:true),
        
        body: Center(

          child: Container(
          height: 500,
          width: 400,
          alignment: Alignment.center,
          child:
          Column(
          children:<Widget> ///////child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:<Widget>[Image.asset('images/logo.png')],
          [
          Container(
          height: 250,
          width: 150,
          alignment: Alignment.topCenter,
          child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:<Widget>[Image.asset('images/logo.png')])),
          // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
          Container( //<- контейнер с двумя кнопками
          height: 150,
          width: 180,
          alignment: Alignment.center,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>
          [
          TextButton(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),foregroundColor: Colors.grey),
          onPressed: () {
             // ignore: avoid_print
             Navigator.pushNamed(context, AppRoutes.login);
          },
          child:  Container(
            height: 35,
            width: 180,
            alignment: Alignment.center,
            child: Text("Вход"),
          ),
        ),
        TextButton(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),foregroundColor: Colors.grey),
          onPressed: () {
             Navigator.pushNamed(context, AppRoutes.register);

          },
          child:  Container(
            height: 35,
            width: 180,
            alignment: Alignment.center,
            child: Text("Регистрация"),
            
          ),
         )
          ]
          )
          ),
        ], //ctmain2
       ),
      )
  
    )
    )
    );
  }
}
