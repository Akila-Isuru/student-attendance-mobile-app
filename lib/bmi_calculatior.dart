import 'package:flutter/material.dart';

class BMICalculatiorPage extends StatefulWidget {
  const BMICalculatiorPage({super.key});

  @override
  State<BMICalculatiorPage> createState() => _BMICalculatiorPageState();
}

class _BMICalculatiorPageState extends State<BMICalculatiorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" BMI Calculator")),

      body: Container(
        // color: Colors.red,
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
                    Column(children: [Icon(Icons.male), Text("Male")]),
                    SizedBox(width: 50),
                    Column(children: [Icon(Icons.female), Text("Female")]),
                  ],
                ),
                Column(
                  children: [
                    const Text("Height"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "183",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Weight"),
                        Text(
                          "74",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
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
                    Column(
                      children: [
                        Text("Age"),
                        Text(
                          "19",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
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
                  ],
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text("Calculate BMI")),
          ],
        ),
      ),
    );
  }
}
