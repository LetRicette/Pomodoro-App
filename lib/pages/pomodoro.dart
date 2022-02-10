import 'package:flutter/material.dart';
import 'package:pomodoro/components/inputTime.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Pomodoro"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InputTime(
                title: 'Trabalho',
                value: 25,
              ),
              InputTime(
                title: 'Descanso',
                value: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
