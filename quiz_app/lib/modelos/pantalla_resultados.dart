import 'package:flutter/material.dart';
import 'package:quiz_app/data/preguntas.dart';
import 'package:quiz_app/modelos/question_summary.dart';

class PantallaResultados extends StatelessWidget {
  const PantallaResultados(this.respuestasSelecionadas, this.reiniciarQuiz,
      {super.key});

  final List<String> respuestasSelecionadas;
  final Function() reiniciarQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < respuestasSelecionadas.length; i++) {
      summary.add({
        'question_index': i,
        'pregunta': questions[i].text,
        'respuesta_seleccionada': respuestasSelecionadas[i],
        'respuesta_correcta': questions[i].respuesta[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int correctas = summaryData.where(
      (info) {
        return info['respuesta_seleccionada'] == info['respuesta_correcta'];
      },
    ).length;
    final int total = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Respuestas correctas $correctas de un total de $total'),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.restart_alt_rounded),
              onPressed: reiniciarQuiz,
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
