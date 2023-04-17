import 'dart:io';

import 'package:english_words_game/components/widgets/pop_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../data/user/user.dart';
import '../utils/screen_size.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopButton(context),
              const SizedBox(height: 20,),


              Center(

                child: SizedBox(
                  width: ScreenSize.width(context) - 200,
                  height: ScreenSize.width(context) - 300,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () async {
                                final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                var path = await getApplicationDocumentsDirectory();
                                final String imagePath = '${path.path}/avatar.png';
                                await image!.saveTo(imagePath);
                              setState(() async {
                                await User.setImagePath(imagePath);
                              });
                            },
                            child: Icon(Icons.edit)),
                      ),
                      Align(
                        alignment: Alignment.center,
                        // виджет что делает дочерний виджет круглым
                        child: ClipOval(
                          child: SizedBox(
                              width: ScreenSize.width(context) - 300,
                              height: ScreenSize.width(context) - 300,
                              // если путь к файлу с картинкой пуст, то будет показываться стандартная ава
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: User.imagePath == '' ? Image.asset('assets/images/standard_avatar.png') : Image.file(File(User.imagePath)))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(child: Text(User.nickname, style: const TextStyle(fontSize: 24),)),
              const SizedBox(height: 20,),
              const Center(child: Icon(Icons.star, size: 60, color: Colors.yellow,)),
              const SizedBox(height: 20,),
              Center(child: Text(User.stars.toString(), style: const TextStyle(fontSize: 24),)),
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
