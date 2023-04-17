import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/session.dart';
import '../../data/user/user.dart';
import '../../routes/routes.dart';
import '../data/repository.dart';
import '../data/word_model.dart';

// контроллер для управления состоянием страницы с игрой
class PlayController extends GetxController {

  final PlayRepository repo = PlayRepository();

  Color getHpColor () {
    if(Session.hp > 7) return Colors.greenAccent;
    else if(Session.hp > 4) return Colors.orangeAccent;
    else return Colors.redAccent;
  }

  void trueChooseResult (BuildContext context) {

        Session.stars += 100;
        // метод обновляющий этот виджет

        Timer(Duration(seconds: 1), () {
          Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.play,
                  (route) => false);
        });

  }

  void falseChooseResult (BuildContext context) {
    Session.hp = Session.hp - 1;
    if (Session.hp > 0) {
      Timer(Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.play,
                (route) => false);
      });
    } else {
      User.stars += Session.stars;
      Timer(Duration(seconds: 1), ()
      {
        Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.playResult,
                (route) => false);
      });
    }

  }
}