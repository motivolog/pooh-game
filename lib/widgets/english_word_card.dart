import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pooh_game/constants/const.dart';
import '../models/model.dart';

class EnglishWordCard extends StatefulWidget {
  const EnglishWordCard({super.key});

  @override
  State<EnglishWordCard> createState() => _EnglishWordCardState();
}

class _EnglishWordCardState extends State<EnglishWordCard> {
  final url = 'https://pooh.popygame.com/vocabulary-01.json';

  Future<MyWords> _getMyWords() async {
    final Response = await http.get(Uri.parse(url));
    if (Response.statusCode == 200) {
      return MyWords.fromJson(jsonDecode(Response.body));
    } else {
      throw Exception('failted to load word');
    }
  }

  late Future<MyWords> myWords;

  @override
  void initState() {
    super.initState();
    myWords = _getMyWords();
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
          setState(() {
            wordCount++;
          });
        } else if (direction == DismissDirection.startToEnd) {
          setState(() {
            wordCount--;
          });
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
                          TextButton(onPressed: () {}, child: engWords()),
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
                    TextButton(onPressed: () {}, child: trWords()),
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
          totalWord = snapshot.data!.dataset.length as int;
          int itemCount = totalWord;
          debugPrint(totalWord.toString());
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
