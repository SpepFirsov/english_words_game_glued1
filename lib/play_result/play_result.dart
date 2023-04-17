import 'package:flutter/material.dart';

import '../data/session.dart';
import '../routes/routes.dart';

class PlayResult extends StatelessWidget {
  const PlayResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(

                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Игра окончена'.toUpperCase(), style: const TextStyle(color: Colors.red, fontSize: 32, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30,),
                      Text('Вы заработали:'.toUpperCase(), style: const TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30,),
                      Text(Session.stars.toString(), style: const TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30,),
                      const Icon(Icons.star, size: 60, color: Colors.yellow,),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    Session.stars = 0;
                    Session.hp = 10;
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.play, (route) => false);
                  }, child: const Text('Заново', style: TextStyle(fontSize: 32, color: Colors.black54),)),
                  TextButton(onPressed: () {
                    Session.stars = 0;
                    Session.hp = 10;
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
                  }, child: const Text('В меню', style: TextStyle(fontSize: 32, color: Colors.black54),)),
                ],
              ),
            )),
            const Expanded(
                flex: 1,
                child: SizedBox())

          ],
        ),
        ),
      ),
    );
  }
}
