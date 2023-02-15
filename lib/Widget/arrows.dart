import 'package:flutter/material.dart';
import '../constants/const.dart';

class Arrows extends StatelessWidget {
  const Arrows({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Remind Me', style: Constants.getArrowTextStyle()),
            const SizedBox(
              width: 6,
            ),
            Text('I Know', style: Constants.getArrowTextStyle())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Image(
                image: AssetImage('assets/icons/ArrowLeft.png'),
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Image(
                image: AssetImage('assets/icons/ArrowRight.png'),
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
