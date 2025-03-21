class GameControl {
  List<int> board = List.filled(9, 0); // 0: empty, 1: player, 2: AI

  bool makeMove(int index, int player) {
    if (board[index] == 0) {
      board[index] = player;
      return true;
    }
    return false;
  }

  int checkWinner() {
    const List<List<int>> winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var positions in winningPositions) {
      if (board[positions[0]] != 0 &&
          board[positions[0]] == board[positions[1]] &&
          board[positions[1]] == board[positions[2]]) {
        return board[positions[0]];
      }
    }
    return 0;
  }

  int getAIMove() {
    // Check if AI can win in the next move
    for (int i = 0; i < board.length; i++) {
      if (board[i] == 0) {
        board[i] = 2;
        if (checkWinner() == 2) {
          board[i] = 0;
          return i;
        }
        board[i] = 0;
      }
    }

    // Block the player's winning move
    for (int i = 0; i < board.length; i++) {
      if (board[i] == 0) {
        board[i] = 1;
        if (checkWinner() == 1) {
          board[i] = 0;
          return i;
        }
        board[i] = 0;
      }
    }

    // Take the center if available
    if (board[4] == 0) {
      return 4;
    }

    // Take any corner if available
    const List<int> corners = [0, 2, 6, 8];
    for (int corner in corners) {
      if (board[corner] == 0) {
        return corner;
      }
    }

    // Take any side if available
    const List<int> sides = [1, 3, 5, 7];
    for (int side in sides) {
      if (board[side] == 0) {
        return side;
      }
    }

    // If no move is possible, return -1
    return -1;
  }
}
