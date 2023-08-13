import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

String? SelectedGender;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int height = 120;
  int weight = 35;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, ResultScreen.id,);

          double bmi = weight / ((height * 0.01) * (height * 0.01));

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                      Bmi: bmi,
                    )),
          );
        },
        child: Container(
          height: 70,
          color: KAccentColor,
          child: Center(
              child: Text(
            "CALCULATE YOUR BMI",
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
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            // gendere Selection tile
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  GenderCard(
                    name: "MALE",
                    icon: Icons.male,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GenderCard(
                    name: "FEMALE",
                    icon: Icons.female,
                  ),
                ],
              ),
            )),
            //Height Selection Slider
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: KCardBackgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kTextStyle.copyWith(color: kSubTextColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyle.copyWith(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "CM",
                        style: kTextStyle.copyWith(color: kSubTextColor),
                      ),
                    ],
                  ),
                  Slider(
                      thumbColor: KAccentColor,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      min: 100,
                      max: 300,
                      value: height.toDouble(),
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      })
                ],
              ),
            )),
            // Age Selector
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: KCardBackgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kTextStyle.copyWith(color: kSubTextColor),
                      ),
                      Text(weight.toString(),
                          style: kTextStyle.copyWith(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (weight >= 2) {
                                weight--;
                                setState(() {});
                              }
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleButton(
                            icon: Icons.add,
                            onTap: () {
                              weight++;
                              setState(() {});
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: KCardBackgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kTextStyle.copyWith(color: kSubTextColor),
                      ),
                      Text(age.toString(),
                          style: kTextStyle.copyWith(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (age >= 2) {
                                age--;
                                setState(() {});
                              }
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleButton(
                            icon: Icons.add,
                            onTap: () {
                              age++;
                              setState(() {});
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  Function onTap;
  IconData icon;

  CircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: KbuttonColor,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

class GenderCard extends StatefulWidget {
  String name;
  IconData icon;

  GenderCard({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? kActiveCardColour : KCardBackgroundColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 100,
              ),
              Text(
                widget.name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
