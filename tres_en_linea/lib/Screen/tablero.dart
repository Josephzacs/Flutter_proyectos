import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tres_en_linea/Services/game_control.dart';

class Tablero extends StatefulWidget {
  const Tablero({super.key, required this.jugador, required this.contraIA});
  final int jugador;
  final bool contraIA;

  @override
  TableroState createState() => TableroState();
}

class TableroState extends State<Tablero> {
  final GameControl game = GameControl();
  final Logger logger = Logger();
  int currentPlayer = 1;

  void _handleTap(int index) {
    if (game.makeMove(index, currentPlayer)) {
      setState(() {});
      logger.d('Jugador $currentPlayer ha pulsado la casilla $index');
      int winner = game.checkWinner();
      if (winner != 0) {
        _showWinnerDialog(winner);
        return;
      }

      if (game.board.every((element) => element != 0)) {
        _showWinnerDialog(0); // Empate
        return;
      }

      if (widget.contraIA && currentPlayer == widget.jugador) {
        int aiMove = game.getAIMove();
        if (aiMove != -1) {
          game.makeMove(aiMove, 2);
          setState(() {});
          logger.d('IA ha pulsado la casilla $aiMove');
          winner = game.checkWinner();
          if (winner != 0) {
            _showWinnerDialog(winner);
            return;
          }

          if (game.board.every((element) => element != 0)) {
            _showWinnerDialog(0); // Empate
            return;
          }
        }
      } else {
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      }
    }
  }

  void _showWinnerDialog(int winner) {
    String title;
    if (winner == 0) {
      title = 'Empate!';
    } else {
      title = 'Ganó el Jugador $winner!';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  game.board.fillRange(0, 9, 0);
                  currentPlayer = 1;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tres en raya'),
      ),
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => _handleTap(index),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Icon(
                  game.board[index] == 1
                      ? Icons.close
                      : game.board[index] == 2
                          ? Icons.radio_button_unchecked
                          : null,
                  size: 50,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
