import 'package:english_words_game/play/data/data_source.dart';
import 'package:english_words_game/play/data/word_model.dart';

class PlayRepository {
  PlayDataSource _dataSource = PlayDataSource();
  Future<List<WordModel>> getWords () async {
    return _dataSource.getWords();
  }
}