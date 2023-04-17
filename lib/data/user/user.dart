import 'package:shared_preferences/shared_preferences.dart';

class User {
  static late final int id;
  static late final String nickname;
  static late final String password;
  static late int stars = 0;
  static late String imagePath;

  // инициализация пользователя из локального хранилища
  static Future userInit () async {
    // объект методы которого мы вызываем, что бы сохранять и брать данные
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // если никнейма нету то он пуст, так и с остальными полями
    id = prefs.getInt('id') ?? 0;
    nickname = prefs.getString('nickname') ?? 'Apple';
    password  = prefs.getString('password') ?? '123456';
    stars = prefs.getInt('stars') ?? 0;
    imagePath = prefs.getString('image') ?? '';
  }

  static Future setId (value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // локально устанавливает рейтинг
    await prefs.setInt('id', value);
    id = value;
  }
  static Future setNickname (value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // локально устанавливает ник
    await prefs.setString('nickname', value);
    nickname = value;
  }
  static Future setPassword (value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // локально устанавливает ник
    await prefs.setString('password', value);
    password = value;
  }
  static Future setStars (value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // локально устанавливает рейтинг
    await prefs.setInt('stars', value);
    stars = value;
  }
  static Future setImagePath (value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // локально устанавливает путь к картинке
    await prefs.setString('image', value);
    imagePath = value;
  }
}