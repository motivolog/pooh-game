import 'package:flutter/material.dart';
import 'package:pooh_game/widgets/english_word_card.dart';
import '../constants/const.dart';
import '../widgets/arrows.dart';

class EnglishToTurkish extends StatefulWidget {
  const EnglishToTurkish({super.key});

  @override
  State<EnglishToTurkish> createState() => _EnglishToTurkishState();
}

class _EnglishToTurkishState extends State<EnglishToTurkish> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.getBackgroundColor(),
      appBar: AppBar(
        backgroundColor: Constants.getButtonBackgroundColor(),
        centerTitle: true,
        title: Text('PoohGame - English to Turkish'),
      ),
      body: Center(
        child: Column(
          children: [
            Arrows(),
            SizedBox(
              height: 30,
            ),
            EnglishWordCard(),
          ],
        ),
      ),
    );
  }
}
