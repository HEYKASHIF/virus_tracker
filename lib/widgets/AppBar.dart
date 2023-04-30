import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.pink,
    centerTitle: true,
    elevation: 0,
    title: Text(
      'Virus_Tracker',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
