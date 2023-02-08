import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pooh_game/constants/const.dart';
import '../models/model.dart';
import 'package:pooh_game/services/words_api.dart';

class EnglishWordCard extends StatefulWidget {
  const EnglishWordCard({super.key});

  @override
  State<EnglishWordCard> createState() => _EnglishWordCardState();
}

class _EnglishWordCardState extends State<EnglishWordCard> {
  late Future<MyWords> myWords;

  @override
  void initState() {
    super.initState();
    myWords = WordApi().getMyWords();
  }

  int wordCount = 0;
  var totalWord = 5;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      dragStartBehavior: DragStartBehavior.start,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart && wordCount < totalWord) {
          setState(() {
            wordCount++;
          });
        } else if (direction == DismissDirection.startToEnd &&
            wordCount > totalWord) {
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

  FutureBuilder<MyWords> lenghtWords() {
    return FutureBuilder(
      future: myWords,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString().length.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
