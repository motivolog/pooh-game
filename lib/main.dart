import 'dart:async';
import 'package:wordprediction/constants/const.dart';
import 'pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PoohGame());
}

class PoohGame extends StatelessWidget {
  const PoohGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/entrypage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
