import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String data;
  final Color textcolor;
  final String belowdata;
  const MyCard(
      {super.key,
      required this.data,
      required this.textcolor,
      required this.belowdata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: 180,
        color: Colors.amber,
      ),
    );
  }
}
