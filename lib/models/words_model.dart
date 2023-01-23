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
    this.reminder,
  });

  String? word;
  String? meaning;
  String? type;
  List<String>? reminder;

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        word: json["word"],
        meaning: json["meaning"],
        type: json["type"],
        reminder: json["reminder"] == null
            ? []
            : List<String>.from(json["reminder"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "meaning": meaning,
        "type": type,
        "reminder":
            reminder == null ? [] : List<dynamic>.from(reminder!.map((x) => x)),
      };
}
