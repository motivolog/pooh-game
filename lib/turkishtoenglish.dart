import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class TurkishToEnglish extends StatefulWidget {
  const TurkishToEnglish({super.key});

  @override
  State<TurkishToEnglish> createState() => _TurkishToEnglishState();
}

class _TurkishToEnglishState extends State<TurkishToEnglish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: Text(
          'Turkish to English',
        ),
      ),
      backgroundColor: Color(0xFFFFE3D7),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Remind Me',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'I Know',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
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
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: FlipCard(
                  alignment: Alignment.center,
                  direction: FlipDirection.HORIZONTAL,
                  front: Stack(
                    children: [
                      Container(
                        width: 280,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFF6F6F),
                              offset: Offset(0, 0),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Türkçe Kelime\n' * 10,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0FFFF6F6F),
                              offset: Offset(0, 0),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'İngilizce Anlam\n' * 10,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
