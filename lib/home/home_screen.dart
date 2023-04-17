import 'package:english_words_game/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/screen_size.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void exitFromApp () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }

    return Scaffold(
      //виджет отступа
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            children: [
              // виджет, что делит экран на равные части
              Expanded(
                flex: 2,
                //виджет строящий другие виджеты в колону
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // задаём размер кнопки перехода в профиль
                    SizedBox(
                      height: 60,
                      width: 60,
                      // кнопка перехода в профиль
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
    ),
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.profile);

                        }, child: const Icon(Icons.person),),
                    ),
                  //помещает иконку в центре
                Center(
                  child: SizedBox(
                      width: ScreenSize.width(context) - 200,
                      height: ScreenSize.width(context) - 200,
                      child: Image.asset('assets/images/icon.png')),

                ),
            ],
          ),
              ),
              Expanded(
                  flex: 2,
                  child:
              Column(
                // элемента на равном расстоянии друг от друга
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // элементы в центр
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.play);
                  }, child: const Text('Начать', style: TextStyle(fontSize: 32, color: Colors.black54),)),
                  TextButton(onPressed: () {
                    exitFromApp();
                  }, child: const Text('Выход', style: TextStyle(fontSize: 32, color: Colors.black54),)),
                ],
              )
              ),
              Expanded(
                  flex: 1,
                  child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
