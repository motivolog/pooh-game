// To parse this JSON data, do
//
//     final myWords = myWordsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyWords myWordsFromMap(String str) => MyWords.fromJson(json.decode(str));

String myWordsToMap(MyWords data) => json.encode(data.toMap());

class MyWords {
  MyWords({
    required this.version,
    required this.dataset,
  });

  final String version;
  final List<Dataset> dataset;

  factory MyWords.fromJson(Map<String, dynamic> json) => MyWords(
        version: json["version"],
        dataset:
            List<Dataset>.from(json["dataset"].map((x) => Dataset.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "dataset": List<dynamic>.from(dataset.map((x) => x.toMap())),
      };
}

class Dataset {
  Dataset({
    required this.word,
    required this.meaning,
    required this.type,
    required this.reminder,
    required this.reminders,
  });

  final String word;
  final String meaning;
  final String type;
  final dynamic reminder;
  final List<String> reminders;

  factory Dataset.fromMap(Map<String, dynamic> json) => Dataset(
        word: json["word"],
        meaning: json["meaning"],
        type: json["type"],
        reminder: json["reminder"],
        reminders: [],
      );

  Map<String, dynamic> toMap() => {
        "word": word,
        "meaning": meaning,
        "type": type,
        "reminder": reminder,
        "reminders": reminders == null
            ? null
            : List<dynamic>.from(reminders.map((x) => x)),
      };
}
