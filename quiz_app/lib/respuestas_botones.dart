import 'package:flutter/material.dart';

class RespuestaBotones extends StatelessWidget {
  const RespuestaBotones(this.textoRespuesta, this.onTap, {super.key});

  final String textoRespuesta;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          )),
      child: Text(
        textoRespuesta,
        textAlign: TextAlign.center,
      ),
    );
  }
}
