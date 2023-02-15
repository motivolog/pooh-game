import 'package:flutter/material.dart';
import 'package:wordprediction/pages/turkish_to_english.dart';
import '../constants/const.dart';
import 'english_to_turkish.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.getBackgroundColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TurkishToEnglish(),
                  ));
                }),
                icon: const Icon(Icons.translate),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.getButtonBackgroundColor(),
                    fixedSize: const Size(300, 100),
                    side: BorderSide(
                      width: 4,
                      color: Colors.grey.shade100,
                    )),
                label: Text('Turkish - English',
                    style: Constants.getButtonTextStyle())),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EnglishToTurkish(),
                  ));
                }),
                icon: const Icon(Icons.translate),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.getButtonBackgroundColor(),
                    fixedSize: const Size(300, 100),
                    side: BorderSide(
                      width: 4,
                      color: Colors.grey.shade100,
                    )),
                label: Text('English - Turkish',
                    style: Constants.getButtonTextStyle())),
          ],
        ),
      ),
    );
  }
}
