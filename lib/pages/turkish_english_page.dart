import 'package:flutter/material.dart';
import 'package:pooh_game/constants/const.dart';
import 'package:pooh_game/widgets/arrows.dart';
import 'package:pooh_game/widgets/english_word_card.dart';
import 'package:pooh_game/widgets/turkish_word_card.dart';

class TurkishToEnglish extends StatefulWidget {
  const TurkishToEnglish({super.key});

  @override
  State<TurkishToEnglish> createState() => _TurkishToEnglishState();
}

class _TurkishToEnglishState extends State<TurkishToEnglish> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.getBackgroundColor(),
      appBar: AppBar(
        backgroundColor: Constants.getButtonBackgroundColor(),
        centerTitle: true,
        title: Text('PoohGame - Turkish to English'),
      ),
      body: Center(
        child: Column(
          children: [
            Arrows(),
            SizedBox(
              height: 30,
            ),
            TurkishWordCard(),
          ],
        ),
      ),
    );
  }
}
