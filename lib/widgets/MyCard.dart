import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String data;
  final Color textcolor;
  final String belowdata;
  final Color BgColor;
  const MyCard(
      {super.key,
      required this.data,
      required this.textcolor,
      required this.belowdata,
      required this.BgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: 180,
        // color: Colors.amber,
        decoration: BoxDecoration(
          color: BgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data,
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                belowdata,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
