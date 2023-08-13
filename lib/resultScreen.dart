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
  String? SelectedGender;

  String GetReview() {
    if (widget.Bmi < 18.5) {
      return "Underweight";
    } else if (widget.Bmi >= 18.5 && widget.Bmi < 24.9) {
      return "Normal Weight";
    } else if (widget.Bmi >= 24.9 && widget.Bmi < 30) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 70,
          color: KAccentColor,
          child: Center(
              child: Text(
            "RE-CALCULATE",
            style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
      )),
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
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: KCardBackgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.Bmi.toStringAsPrecision(4) ?? "56",
                      style: kTextStyle.copyWith(fontSize: 50),
                    ),
                    Text(
                      GetReview(),
                      style: kTextStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
