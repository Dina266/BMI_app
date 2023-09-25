// import 'package:bmi_app/homeScreen.dart';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.result,
      required this.age,
      required this.isMale});

  final double result;
  final int age;
  final bool isMale;

  get statusWeight {
    String status = '';

    if (result >= 30) {
      status = 'Obese';
    } else if (result >= 25 && result < 30) {
      status = 'Over Weight';
    } else if (result >= 18.5 && result < 25) {
      status = 'Normal';
    } else {
      status = 'Thin';
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
      body: SafeArea(
          child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'Gender : ${isMale ? 'Male' : 'Female'}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Age : ${age.toString()}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Result : ${result.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Healthness : $statusWeight',
            style: Theme.of(context).textTheme.displaySmall,
          )
        ]),
      )),
    );
  }
}
