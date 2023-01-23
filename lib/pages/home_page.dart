import 'package:flutter/material.dart';
import 'package:pooh_game/constants/const.dart';
import 'package:pooh_game/widgets/whichlanguage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.getBackgroundColor(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WhichLanguage(),
          ],
        ),
      ]),
    );
  }
}
