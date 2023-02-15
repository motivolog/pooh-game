import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants/const.dart';
import '../models/word_model.dart';
import '../services/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_speech/text_to_speech.dart';

class WordCardEn extends StatefulWidget {
  const WordCardEn({super.key});

  @override
  State<WordCardEn> createState() => _WordCardEnState();
}

class _WordCardEnState extends State<WordCardEn> {
  late Future<List<WordModel>> _wordListFuture;
  TextToSpeech tts = TextToSpeech();

  @override
  void initState() {
    super.initState();
    _wordListFuture = WordApi.getWordsData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordModel>>(
      future: _wordListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<WordModel> myWordList = snapshot.data!;
          var totalWord = myWordList.length;
          var randomNum = Random().nextInt(totalWord);
          var wordCount = randomNum;
          var word = myWordList[wordCount].word.toString();
          var meaning = myWordList[wordCount].meaning.toString();
          return Dismissible(
            key: UniqueKey(),
            dragStartBehavior: DragStartBehavior.start,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart &&
                  wordCount < totalWord - 1) {
                setState(() {
                  wordCount++;
                });
              } else if (direction == DismissDirection.startToEnd &&
                  wordCount > 0) {
                setState(() {
                  wordCount--;
                });
              } else {
                setState(() {});
                const CircularProgressIndicator();
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                TextButton(
                                    onPressed: () {
                                      tts.setLanguage("en-US");
                                      tts.speak(word.split(',')[0]);
                                    },
                                    child: Text(
                                      word
                                          .toString()
                                          .split(',')[0]
                                          .replaceAll(' ', '\n'),
                                      style: Constants.getWordTextStyle(),
                                    )),
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [Constants.getCardBoxShadow()],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                tts.setLanguage("tr-TR");
                                tts.speak(meaning.split(',')[0]);
                              },
                              child: Text(
                                  meaning
                                      .toString()
                                      .split(',')[0]
                                      .replaceAll(' ', '\n'),
                                  style: Constants.getWordTextStyle())),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return const Center(
            child: Text('get Data Failed.'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
