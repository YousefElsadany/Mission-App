import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int height;
  final int age;
  final int weight;

  ResultScreen({
    required this.result,
    required this.isMale,
    required this.height,
    required this.age,
    required this.weight,
  });
  //const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131429),
      appBar: AppBar(
        backgroundColor: Color(0xff131429),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff40D876)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Heighr : $height cm',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Weight : $weight',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'BMI Result : $result',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
