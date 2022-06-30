import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_app/module/calculator_page/result/ResultView.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double currentSliderValue = 120;
  bool isMale = true;
  int age = 20;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131429),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff131429),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                                  isMale ? Color(0xff40D876) : Colors.white10,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 70.0,
                                color: Colors.white,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                                  isMale ? Colors.white10 : Color(0xff40D876),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,
                                  size: 70.0, color: Colors.white),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HIGHR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${currentSliderValue.round()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Slider(
                        value: currentSliderValue,
                        max: 220,
                        min: 80,
                        activeColor: Color(0xff40D876),
                        //mouseCursor: MouseCursor.uncontrolled,
                        //autofocus: true,
                        label: currentSliderValue.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            currentSliderValue = value;
                            print(value.round());
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'age-',
                                  splashColor: Color(0xff40D876),
                                  backgroundColor: Colors.grey,
                                  mini: true,
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'age++',
                                  splashColor: Color(0xff40D876),
                                  backgroundColor: Colors.grey,
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  heroTag: 'weight-',
                                  splashColor: Color(0xff40D876),
                                  backgroundColor: Colors.grey,
                                  mini: true,
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: 'weight+',
                                  splashColor: Color(0xff40D876),
                                  backgroundColor: Colors.grey,
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            color: Color(0xff40D876),
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(currentSliderValue / 100, 2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            result: result.round(),
                            isMale: isMale,
                            height: currentSliderValue.round(),
                            age: age,
                            weight: weight,
                          )),
                );
              },
              child: Text(
                'CALCULATER',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
