import 'package:flutter/material.dart';
import 'package:virus_tracker/widgets/AppBar.dart';
import 'package:virus_tracker/widgets/MyCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: MyCard(
                  data: '5',
                  textcolor: Colors.black,
                  belowdata: 'Todays Cases'),
            ),
            Expanded(
              child: MyCard(
                  data: '500',
                  textcolor: Colors.black,
                  belowdata: 'Total Cases'),
            ),
          ],
        ),
      ),
    );
  }
}
