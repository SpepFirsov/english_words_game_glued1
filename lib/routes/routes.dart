import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../play/view/play_screen.dart';
import '../play_result/play_result.dart';
import '../profile/profile_screen.dart';
import '../startscreen_log_and_registration/login.dart';
import '../startscreen_log_and_registration/reg.dart';
import '../startscreen_log_and_registration/start.dart';



class AppRoutes {
  static const String home = '';
  static const String profile = '/profile';
  static const String play = '/play';
  static const String playResult = '/play_result';
  static const String start = 'start';
  static const String register = 'register';
  static const String login = 'login';



  static Map<String, WidgetBuilder> routes = {
    home:  (context) => const Home(),
    profile:  (context) => const Profile(),
    play:  (context) => const Play(),
    playResult:  (context) => const PlayResult(),
    start:  (context) =>const Welcome_Screen(),
    register:  (context) => const Reg_Screen(),
    login:  (context) => const Login_Screen(),



  };
}