import 'package:flutter/material.dart';
import '../Widget/arrows.dart';
import '../Widget/word_card_tr.dart';
import '../constants/const.dart';

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
        title: const Text('PoohGame - Turkish to English'),
      ),
      body: Center(
        child: Column(
          children: const [
            Arrows(),
            SizedBox(
              height: 10,
            ),
            WordCardTR()
          ],
        ),
      ),
    );
  }
}
