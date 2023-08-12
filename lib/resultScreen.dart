import 'package:flutter/material.dart';

import 'constants.dart';

class ResultScreen extends StatefulWidget {
  double Bmi;

  ResultScreen({super.key, required this.Bmi});

  static String id = "ResultScreen";

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: KPrimaryColor,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Result",
              style: kTextStyle.copyWith(fontSize: 40),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: KCardBackgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.Bmi.toString() ?? "56",
                style: kTextStyle.copyWith(fontSize: 50),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
