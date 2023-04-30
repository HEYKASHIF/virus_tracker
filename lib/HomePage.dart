import 'package:flutter/material.dart';
import 'package:virus_tracker/constant/API.dart';
import 'package:virus_tracker/widgets/AppBar.dart';
import 'package:virus_tracker/widgets/MyCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var TotalCase, TodayCase, TotalDeaths, TodayDeaths, Population;

List _countries = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String current = "No Country selected";
  String flag = "";
  // ignore: non_constant_identifier_names
  void FetchData() async {
    http.Response response = await http.get(Uri.parse(Api));
    final countries = json.decode(response.body);
    setState(() {
      _countries = countries;
    });
  }

  void GetData(current) async {
    http.Response response = await http.get(Uri.parse(Api + "/" + current));
    final Data = json.decode(response.body);

    setState(() {
      TotalCase = Data['cases'];
      TodayCase = Data['todayCases'];
      TotalDeaths = Data['deaths'];
      TodayDeaths = Data['todayDeaths'];
      Population = Data['population'];
      flag = Data['countryInfo']['flag'];
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
      backgroundColor: Colors.pink,
      appBar: appBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            flag.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(flag),
                      radius: 45,
                      backgroundColor: Colors.transparent,
                    ),
                  )
                : SizedBox(
                    width: 10,
                  ),
            _countries.isNotEmpty
                ? DropdownButton(
                    hint: Text(
                      'Choose country',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    ),
                    items: _countries.map((value) {
                      return DropdownMenuItem(
                        value: value['country'],
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(value['countryInfo']['flag']),
                              radius: 30,
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(value['country']),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        current = value.toString();
                        GetData(current);
                      });
                    },
                  )
                : const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyCard(
                        BgColor: Colors.green,
                        data: TodayCase == null ? "-" : TodayCase.toString(),
                        textcolor: Colors.white,
                        belowdata: 'Todays Cases'),
                  ),
                  Expanded(
                    child: MyCard(
                        BgColor: Colors.amber,
                        data:
                            TodayDeaths == null ? "-" : TodayDeaths.toString(),
                        textcolor: Colors.white,
                        belowdata: 'Todays Deaths'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyCard(
                        BgColor: Colors.black,
                        data: TotalCase == null ? "-" : TotalCase.toString(),
                        textcolor: Colors.white,
                        belowdata: 'Total Cases'),
                  ),
                  Expanded(
                    child: MyCard(
                        BgColor: Colors.red,
                        data:
                            TotalDeaths == null ? "-" : TotalDeaths.toString(),
                        textcolor: Colors.white,
                        belowdata: 'Total Deaths'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
