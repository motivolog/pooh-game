import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pooh_game/models/model.dart';
import 'package:http/http.dart' as http;

class WordApi {
  final url = 'https://pooh.popygame.com/vocabulary-01.json';

  Future<MyWords> getMyWords() async {
    final Response = await http.get(Uri.parse(url));
    if (Response.statusCode == 200) {
      return MyWords.fromJson(jsonDecode(Response.body));
    } else {
      throw Exception('failted to load word');
    }
  }
}
