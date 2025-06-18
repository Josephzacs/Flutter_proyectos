import 'package:flutter/material.dart';
import 'package:quiz_app/respuestas_botones.dart';
import 'data/preguntas.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaPreguntas extends StatefulWidget {
  const PantallaPreguntas({super.key, required this.alSeleccionarRespuesta});
  final void Function(String respuesta) alSeleccionarRespuesta;

  @override
  State<PantallaPreguntas> createState() => _PantallaPreguntasState();
}

class _PantallaPreguntasState extends State<PantallaPreguntas> {
  var preguntaIndex = 0;

  void responderPregunta(String respuestaSelecionada) {
    widget.alSeleccionarRespuesta(respuestaSelecionada);
    setState(() {
      preguntaIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final preguntaActual = questions[preguntaIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              preguntaActual.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 227, 168, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...preguntaActual.getShuffledRespuestas().map((respuesta) {
              return RespuestaBotones(respuesta, () {
                responderPregunta(respuesta);
              });
            }),
          ],
        ),
      ),
    );
  }
}
