import 'dart:math';

import 'package:bmi_app/result_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  int age = 21;
  double heightVal = 160;
  int weight = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Expanded(
              child: Row(
                children: [
                  n1Expanded(context, 'male'),
                  const SizedBox(width: 10),
                  n1Expanded(context, 'female')
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          heightVal.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'CM',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    Slider(
                      // activeColor: Colors.teal,
                      value: heightVal,
                      onChanged: (newVal) {
                        setState(() {
                          heightVal = newVal;
                        });
                      },
                      min: 10,
                      max: 200,
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: Row(
              children: [
                n2Expanded(context, 'age'),
                const SizedBox(width: 10),
                n2Expanded(context, 'weight')
              ],
            )),
            Container(
              color: Colors.teal,
              height: MediaQuery.of(context).size.height / 15,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    var result = weight / pow(heightVal / 100, 2);
                    // print(result);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Result(result: result, age: age, isMale: isMale);
                      },
                    ));
                  });
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            )
          ])),
    );
  }

  Expanded n1Expanded(BuildContext context, String type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMale = type == 'male' ? true : false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  type == 'male' ? Icons.male : Icons.female,
                  size: 60,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  type == 'male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded n2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                type == 'age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age--' : 'weight--',
                    mini: true,
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    },
                    backgroundColor: Colors.teal,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    heroTag: type == 'age' ? 'age++' : 'weight++',
                    mini: true,
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    },
                    backgroundColor: Colors.teal,
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
