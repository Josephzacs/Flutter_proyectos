import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EstiloTexto extends StatelessWidget {
  EstiloTexto(this.texto, {super.key});
  String texto;
  @override
  Widget build(context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
