import 'package:flutter/material.dart';
import '../Widget/arrows.dart';
import '../Widget/word_card_en.dart';
import '../constants/const.dart';

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
        title: const Text('PoohGame - English to Turkish'),
      ),
      body: Center(
        child: Column(
          children: const [
            Arrows(),
            SizedBox(
              height: 30,
            ),
            WordCardEn()
          ],
        ),
      ),
    );
  }
}
