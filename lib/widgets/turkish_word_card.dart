import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pooh_game/constants/const.dart';
import '../models/model.dart';

class TurkishWordCard extends StatefulWidget {
  const TurkishWordCard({super.key});

  @override
  State<TurkishWordCard> createState() => _TurkishWordCardState();
}

class _TurkishWordCardState extends State<TurkishWordCard> {
  final url = 'https://pooh.popygame.com/vocabulary-01.json';

  Future<MyWords> _getMyWords() async {
    final Response = await http.get(Uri.parse(url));
    if (Response.statusCode == 200) {
      var _list = MyWords.fromJson(jsonDecode(Response.body));
      return _list;
    } else {
      throw Exception('failted to load word');
    }
  }

  late Future<MyWords> myWords;
  late Future<MyWords> _list;

  @override
  void initState() {
    super.initState();
    myWords = _getMyWords();
    _list = _getMyWords();
  }

  int wordCount = 0;
  late int totalWord;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      dragStartBehavior: DragStartBehavior.start,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          if (wordCount < 6) {
            setState(() {
              wordCount++;
            });
          }
        } else if (direction == DismissDirection.startToEnd) {
          if (wordCount > 0) {
            setState(() {
              wordCount--;
            });
          }
        }
      },
      child: FlipCard(
        alignment: Alignment.center,
        direction: FlipDirection.HORIZONTAL,
        front: Stack(
          children: [
            Container(
              width: 280,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [Constants.getCardBoxShadow()],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {}, child: trWords()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        back: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: 280,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [Constants.getCardBoxShadow()],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: engWords()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<MyWords> trWords() {
    return FutureBuilder(
      future: _getMyWords(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
              snapshot.data!.dataset[wordCount].meaning
                  .split(',')[0]
                  .replaceAll(' ', '\n')
                  .toString(),
              style: Constants.getWordTextStyle());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<MyWords> engWords() {
    return FutureBuilder(
      future: _getMyWords(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
              snapshot.data!.dataset[wordCount].word
                  .split(',')[0]
                  .replaceAll(' ', '\n')
                  .toString(),
              style: Constants.getWordTextStyle());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
