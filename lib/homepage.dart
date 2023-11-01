import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Results.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightValue = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                m1expanded(context, 'male'),
                const SizedBox(
                  width: 15,
                ),
                m1expanded(context, 'female'),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                m2expanded(context, 'wight'),
                const SizedBox(
                  width: 15,
                ),
                m2expanded(context, 'age'),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$heightValue',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: heightValue,
                        onChanged: (newValue) => setState(
                            () => heightValue = newValue.toInt() as double),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.red,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 15,
          child: TextButton(
            onPressed: () {
              var result = weight / pow(heightValue / 100, 2);
              print(result);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            result: result,
                            isMale: isMale,
                            age: age,
                          )));
            },
            child: const Text(
              'calculate',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ])),
    );
  }

  Expanded m1expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.amber
                : Colors.pink,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.pink,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight ',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'wieght--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'wieght++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  child: const Icon(Icons.add),
                  mini: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
