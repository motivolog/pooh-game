import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pooh_game/models/words_model.dart';
import 'package:dio/dio.dart';

class WordApi {
  static const String _url = 'https://pooh.popygame.com/vocabulary-01.json';

  static Future<List> getWordData() async {
    List<dynamic> _list = [];

    final result = await Dio().get(_url);
    final wordList = result.data['dataset'];

    if (result.statusCode == 200) {
      _list = wordList;
    }

    debugPrint(_list.first.toString());

    return _list;
  }
}
