// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';
//import 'package:flutter_application_1/estilo_texto.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer(this.colores, {super.key});
  List<Color> colores;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colores,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
