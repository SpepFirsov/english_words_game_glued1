import 'dart:async';

import 'package:english_words_game/play/view/controller.dart';
import 'package:english_words_game/play/view/widgets/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../components/widgets/pop_button.dart';
import '../../data/session.dart';
import '../../data/user/user.dart';
import '../../routes/routes.dart';
import '../../utils/screen_size.dart';
import '../data/word_model.dart';

class Play extends GetWidget<PlayController> {
  const Play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    final controller = Get.put(PlayController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: FutureBuilder(
              future: controller.repo.getWords(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshots.hasData) {

                  final mainWord = snapshots.data![0];
                  final List<WordModel> words = snapshots.data!..removeAt(0);
                  final List<WordModel> leftSide = [];
                  final List<WordModel> rightSide = [];

                  for(int i = 0; i < words.length; i++) {
                    if(i.isOdd) {
                      leftSide.add(words[i]);
                    } else {
                      rightSide.add(words[i]);
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PopButton(context, func: () {
                        Navigator.pushNamed(context, AppRoutes.home);
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: WordWidget(
                              mainWord.word_en,
                              Colors.grey.withOpacity(0.2),
                              Colors.black54.withOpacity(0.2))),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: SizedBox(
                            height: ScreenSize.height(context) * 0.6,
                            width: ScreenSize.width(context) * 0.8,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: ScreenSize.height(context) * 0.6,
                                  width: ScreenSize.width(context) * 0.35,
                                  child: ListView.builder(
                                      itemCount: leftSide.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var color = Colors.grey.withOpacity(0.2);
                                        var borderColor = Colors.black54.withOpacity(0.2);
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 20),
                                          child: InkWell(
                                              onTap: () {
                                                if (isSelected == false) {
                                                  if (leftSide[index].word_en ==
                                                      mainWord.word_en) {
                                                    color = Colors.green;
                                                    borderColor = Colors.green;
                                                    controller.trueChooseResult(context);
                                                  } else {
                                                    color = Colors.red;
                                                    borderColor = Colors.red;
                                                    controller.falseChooseResult(context);
                                                  }
                                                  controller.update();
                                                } else {
                                                  null;
                                                }
                                              },
                                              child: GetBuilder(
                                                  builder: (PlayController _c) => WordWidget(
                                                      leftSide[index].word_ru,
                                                      color,
                                                      borderColor))),
                                        );
                                      } ),
                                ),
                                SizedBox(width: ScreenSize.width(context) * 0.1,),
                                SizedBox(
                                  height: ScreenSize.height(context) * 0.6,
                                  width: ScreenSize.width(context) * 0.35,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                      itemCount: rightSide.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var color = Colors.grey.withOpacity(0.2);
                                        var borderColor = Colors.black54.withOpacity(0.2);
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 20),
                                          child: InkWell(
                                              onTap: () {
                                                if (isSelected == false) {
                                                  if (rightSide[index].word_en ==
                                                      mainWord.word_en) {
                                                    color = Colors.green;
                                                    borderColor = Colors.green;
                                                    controller.trueChooseResult(context);
                                                  } else {
                                                    color = Colors.red;
                                                    borderColor = Colors.red;
                                                    controller.falseChooseResult(context);
                                                  }
                                                  controller.update();
                                                } else {
                                                  null;
                                                }
                                              },
                                              child: GetBuilder(
                                                  builder: (PlayController _c) => WordWidget(
                                                      rightSide[index].word_ru,
                                                      color,
                                                      borderColor))),
                                        );
                                      } ),
                                )
                              ],
                            )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              width: ((ScreenSize.width(context) - 100) / 10) * Session.hp,
                              height: 50,
                              color: controller.getHpColor(),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              width: ScreenSize.width(context) - 100,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.getHpColor(),
                                  width: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: SizedBox(
                        width: ScreenSize.width(context) - 200,
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Возникла какая-то ошибка!',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.grey.withOpacity(0.5)),
                            ))),
                  );
                }
              }),
        ),
      ),
    );
  }
}
