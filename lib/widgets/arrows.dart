import 'package:flutter/material.dart';
import 'package:pooh_game/constants/const.dart';

class Arrows extends StatelessWidget {
  const Arrows({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Remind Me', style: Constants.getArrowTextStyle()),
              SizedBox(
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
                margin: EdgeInsets.only(top: 10),
                child: Image(
                  image: AssetImage('assets/icons/ArrowLeft.png'),
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image(
                  image: AssetImage('assets/icons/ArrowRight.png'),
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
