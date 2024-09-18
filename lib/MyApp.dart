// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxMethod('Box 1', Alignment.bottomRight),
                  boxMethod('Box 2', Alignment.bottomLeft)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxMethod('Box 3', Alignment.topRight),
                  boxMethod('Box 4', Alignment.topLeft),
                ],
              ),
            ],
          ),
          Center(child: boxMethod('Hello Word', Alignment.center, true))
        ],
      ),
    );
  }

  Container boxMethod(String name, Alignment direction,
      [bool boxRadius = false]) {
    return Container(
      decoration: BoxDecoration(
          color: boxRadius ? Colors.yellow : Colors.green,
          borderRadius: BorderRadius.circular(boxRadius ? 100 : 0)),
      alignment: direction,
      width: 160,
      height: 160,
      child: Text(
        name,
        style: const TextStyle(fontSize: 24, color: Colors.redAccent),
      ),
    );
  }
}
