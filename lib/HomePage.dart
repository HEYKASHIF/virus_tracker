import 'package:flutter/material.dart';
import 'package:virus_tracker/constant/API.dart';
import 'package:virus_tracker/widgets/AppBar.dart';
import 'package:virus_tracker/widgets/MyCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List _countries = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void FetchData() async {
    http.Response response = await http.get(Uri.parse(Api));
    final countries = json.decode(response.body);
    setState(() {
      _countries = countries;
    });
  }

  @override
  void initState() {
    super.initState();
    FetchData();
  }

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
                  BgColor: Colors.green,
                  data: '5',
                  textcolor: Colors.black,
                  belowdata: 'Todays Cases'),
            ),
            Expanded(
              child: MyCard(
                  BgColor: Colors.red,
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
