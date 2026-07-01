import 'package:flutter/material.dart';
import 'package:student_attendance_app/constants.dart';

class BMICalculatiorPage extends StatefulWidget {
  const BMICalculatiorPage({super.key});

  @override
  State<BMICalculatiorPage> createState() => _BMICalculatiorPageState();
}

class _BMICalculatiorPageState extends State<BMICalculatiorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        foregroundColor: kActiveTextColor,
        title: const Text(" BMI Calculator"),
      ),
      backgroundColor: kBackgroundColor,

      body: Container(
        // color: Colors.red,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Text("BMI Calculator"),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: kTileColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(Icons.male, size: 50, color: kActiveTextColor),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 24,
                              color: kActiveTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      color: kTileColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(Icons.female, size: 50, color: Colors.white),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  color: kTileColor,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(color: kActiveTextColor, fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "183",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: kActiveTextColor,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("cm"),
                        ],
                      ),
                      Slider(
                        min: 80,
                        max: 200,
                        value: 183,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: kTileColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: kActiveTextColor,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "74",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: kActiveTextColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  05,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  05,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: kTileColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              color: kActiveTextColor,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "19",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: kActiveTextColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  05,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                shape: ShapeBorder.lerp(
                                  CircleBorder(),
                                  CircleBorder(),
                                  05,
                                ),
                                onPressed: () {},
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(onPressed: () {}, child: Text("Calculate BMI")),
          ],
        ),
      ),
    );
  }
}
