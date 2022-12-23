import 'package:flutter/material.dart';
import 'turkishtoenglish.dart';
import 'englishtoturkish.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE3D7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => TurkishToEnglish())));
                }),
                icon: Icon(Icons.translate),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                    fixedSize: Size(300, 100),
                    side: BorderSide(
                      width: 4,
                      color: Colors.grey.shade100,
                    )),
                label: Text('Turkish - English',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EnglishToTurkish())));
                }),
                icon: Icon(Icons.translate),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade900,
                    fixedSize: Size(300, 100),
                    side: BorderSide(
                      width: 4,
                      color: Colors.grey.shade100,
                    )),
                label: Text(
                  'English - Turkish',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
