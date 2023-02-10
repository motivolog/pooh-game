import '../models/word_model.dart';
import 'package:dio/dio.dart';

class WordApi {
  static const String _url = "https://pooh.popygame.com/vocabulary-01.json";

  static Future<List<WordModel>> getWordsData() async {
    List<WordModel>? myWords = [];
    var result = await Dio().get(_url);
    var wordList = result.data['dataset'];

    if (wordList is List) {
      myWords = wordList.map((e) => WordModel.fromJson(e)).toList();
    } else {
      return [];
    }
    return myWords;
  }
}
