import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal(this.inicioQuiz, {super.key});
  final Function() inicioQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            alignment: Alignment.center,
            width: 350,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          const Text(
            "Aprende Flutter de forma divertida",
            style: TextStyle(color: Colors.white),
          ),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: inicioQuiz,
              icon: const Icon(
                Icons.arrow_right_alt_outlined,
              ),
              label: const Text(
                "Comenzar Quiz",
                style: TextStyle(
                  fontSize: 15,
                ),
              ))
        ],
      ),
    );
  }
}
