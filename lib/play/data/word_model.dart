class WordModel {
  final int id;
  final String word_en;
  final String word_ru;

  WordModel(this.id, this.word_en, this.word_ru);
  
  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(json['Id'], json['English'], json['Russian']);
}