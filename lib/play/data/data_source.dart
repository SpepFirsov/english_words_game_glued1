import 'package:english_words_game/play/data/word_model.dart';

class PlayDataSource {
  Future<List<WordModel>> getWords () async {
    return List.generate(6, (index) => WordModel(index, 'Apple', 'Яблоко'))..add(WordModel(6, 'Dad', 'Батя'));
  }
}