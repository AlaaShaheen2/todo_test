import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allCompleted;
  final int allToDo;
  Counter({super.key, required this.allCompleted, required this.allToDo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Text(
        '$allCompleted/$allToDo',
        style: TextStyle(
          fontSize: 44,
          color: allCompleted == allToDo
              ? Color.fromARGB(255, 62, 217, 132)
              : Colors.white,
        ),
      ),
    );
  }
}
