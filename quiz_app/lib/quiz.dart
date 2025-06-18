import 'package:flutter/material.dart';
import 'data/preguntas.dart';
import 'package:quiz_app/principal.dart';
import 'package:quiz_app/pantalla_preguntas.dart';
import 'modelos/pantalla_resultados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? pantallaActiva;
  List<String> respuestasSeleccionadas = [];

  @override
  void initState() {
    pantallaActiva = Principal(cambioPantalla);
    super.initState();
  }

  void cambioPantalla() {
    setState(() {
      pantallaActiva = PantallaPreguntas(
        alSeleccionarRespuesta: escogerRespuesta,
      );
    });
  }

  void escogerRespuesta(String respuesta) {
    respuestasSeleccionadas.add(respuesta);

    if (respuestasSeleccionadas.length == questions.length) {
      setState(() {
        pantallaActiva =
            PantallaResultados(respuestasSeleccionadas, reiniciarQuiz);
      });
    }
  }

  void reiniciarQuiz() {
    setState(() {
      respuestasSeleccionadas = [];
      pantallaActiva = Principal(cambioPantalla);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: pantallaActiva,
        ),
      ),
    );
  }
}
