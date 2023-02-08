import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pooh_game/constants/const.dart';
import 'package:pooh_game/models/words_model.dart';
import '../models/model.dart';
import 'package:pooh_game/services/words_api.dart';

class TurkishWordCard extends StatefulWidget {
  const TurkishWordCard({super.key});

  @override
  State<TurkishWordCard> createState() => _TurkishWordCardState();
}

class _TurkishWordCardState extends State<TurkishWordCard> {
  late Future<MyWords> myWords;

  @override
  void initState() {
    super.initState();
    myWords = WordApi().getMyWords();
  }

  int wordCount = 0;
  int totalWords = 5;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      dragStartBehavior: DragStartBehavior.start,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart &&
            wordCount < totalWords) {
          setState(() {
            wordCount++;
          });
        } else if (direction == DismissDirection.startToEnd &&
            wordCount > totalWords) {
          setState(() {
            wordCount--;
          });
        } else {
          CircularProgressIndicator();
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
      future: myWords,
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
      future: myWords,
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
