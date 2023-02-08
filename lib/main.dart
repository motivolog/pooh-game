import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pooh_game/models/words_model.dart';
import 'package:pooh_game/pages/home_page.dart';
import 'pages/home_page.dart';
import 'package:pooh_game/services/words_api.dart';

void main() {
  runApp(const PoohGame());
}

class PoohGame extends StatelessWidget {
  const PoohGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PoohGame',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/entrypage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
