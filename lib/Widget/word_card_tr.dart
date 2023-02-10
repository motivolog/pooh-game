import 'package:flip_card/flip_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants/const.dart';
import '../models/word_model.dart';
import '../services/services.dart';

class WordCardTR extends StatefulWidget {
  const WordCardTR({super.key});

  @override
  State<WordCardTR> createState() => _WordCardTRState();
}

class _WordCardTRState extends State<WordCardTR> {
  late Future<List<WordModel>> _wordListFuture;

  @override
  void initState() {
    super.initState();
    _wordListFuture = WordApi.getWordsData();
  }

  var wordCount = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WordModel>>(
      future: _wordListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<WordModel> myWordList = snapshot.data!;
          var totalWord = myWordList.length;
          return Dismissible(
            key: UniqueKey(),
            dragStartBehavior: DragStartBehavior.start,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart &&
                  wordCount < totalWord - 1) {
                debugPrint(totalWord.toString());
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
                                    onPressed: () {},
                                    child: Text(
                                      myWordList[wordCount]
                                          .meaning
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
                              onPressed: () {},
                              child: Text(
                                  myWordList[wordCount]
                                      .word
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
