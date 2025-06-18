// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          [
            const Color.fromARGB(255, 26, 2, 80),
            const Color.fromARGB(255, 1, 16, 48),
          ],
        ),
      ),
    ),
  );
}
