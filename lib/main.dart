import 'package:english_words_game/routes/routes.dart';
import 'package:english_words_game/startscreen_log_and_registration/start.dart';
import 'package:flutter/material.dart';

import 'data/user/user.dart';
import 'home/home_screen.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await User.userInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.start,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome_Screen(),
    );
  }
}