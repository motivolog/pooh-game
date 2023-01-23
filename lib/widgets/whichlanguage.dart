import 'package:flutter/material.dart';
import 'package:pooh_game/constants/const.dart';
import '../pages/english_turkish_page.dart';
import '../pages/turkish_english_page.dart';

class WhichLanguage extends StatefulWidget {
  const WhichLanguage({super.key});

  @override
  State<WhichLanguage> createState() => _WhichLanguageState();
}

class _WhichLanguageState extends State<WhichLanguage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TurkishToEnglish(),
                ));
              }),
              icon: Icon(Icons.translate),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.getButtonBackgroundColor(),
                  fixedSize: Size(300, 100),
                  side: BorderSide(
                    width: 4,
                    color: Colors.grey.shade100,
                  )),
              label: Text('Turkish - English',
                  style: Constants.getButtonTextStyle())),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EnglishToTurkish(),
                ));
              }),
              icon: Icon(Icons.translate),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.getButtonBackgroundColor(),
                  fixedSize: Size(300, 100),
                  side: BorderSide(
                    width: 4,
                    color: Colors.grey.shade100,
                  )),
              label: Text('English - Turkish',
                  style: Constants.getButtonTextStyle())),
        ],
      ),
    );
  }
}
