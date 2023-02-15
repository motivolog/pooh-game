// To parse this JSON data, do
//
//     final wordModel = wordModelFromJson(jsonString);

import 'dart:convert';

WordModel wordModelFromJson(String str) => WordModel.fromJson(json.decode(str));

String wordModelToJson(WordModel data) => json.encode(data.toJson());

class WordModel {
  WordModel({
    this.word,
    this.meaning,
    this.type,
  });

  String? word;
  String? meaning;
  String? type;

  @override
  String toString() {
    return word!;
  }

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        word: json["word"],
        meaning: json["meaning"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "meaning": meaning,
        "type": type,
      };
}
