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
                  data: 'data',
                  textcolor: Colors.black,
                  belowdata: 'belowdata'),
            ),
            Expanded(
              child: MyCard(
                  data: 'data2',
                  textcolor: Colors.black,
                  belowdata: 'belowdata2'),
            ),
          ],
        ),
      ),
    );
  }
}
