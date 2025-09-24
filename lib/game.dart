import 'dart:io';
import 'dart:math';
import 'player.dart';
import 'ai_player.dart';

class Game {
  late List<List<String>> board;
  late int size;
  late Player player1;
  late Player player2;
  late Player currentPlayer;
  bool aiMode = false;

  Game(this.size) {
    board = List.generate(size, (_) => List.filled(size, ' '));
    player1 = Player('X');
    player2 = Player('O');
    currentPlayer = Random().nextBool() ? player1 : player2;
  }

  void setAiMode() {
    aiMode = true;
    player2 = AiPlayer('O');
  }

  void start() {
    while (true) {
      printBoard();
      if (aiMode && currentPlayer == player2) {
        (player2 as AiPlayer).makeMove(board, size);
      } else {
        currentPlayer.makeMove(board, size);
      }
      if (checkWin(currentPlayer.symbol)) {
        printBoard();
        print('Игрок ${currentPlayer.symbol} победил!');
        break;
      }
      if (isBoardFull()) {
        printBoard();
        print('Патовая ситуация!');
        break;
      }
      switchPlayers();
    }
  }

  void printBoard() {
    int cellWidth = 3;
    String rowDivider =
        '  +' + List.filled(size, '-' * cellWidth).join('+') + '+';

    String rowNumbers = List.generate(
      size,
      (i) => (i + 1).toString().padLeft(2),
    ).join(' ');
    print('    $rowNumbers');

    for (int i = 0; i < size; i++) {
      print(
        '${(i + 1).toString().padLeft(2)} | ' +
            board[i]
                .map((cell) => cell.padRight(cellWidth - 1) + ' ')
                .join('| ') +
            '|',
      );
      if (i < size - 1) print(rowDivider);
    }
    print('');
  }

  void switchPlayers() {
    currentPlayer = (currentPlayer == player1) ? player2 : player1;
  }

  bool checkWin(String symbol) {
    for (int i = 0; i < size; i++) {
      if (board[i].every((cell) => cell == symbol)) return true;
    }
    for (int i = 0; i < size; i++) {
      if (List.generate(
        size,
        (j) => board[j][i],
      ).every((cell) => cell == symbol))
        return true;
    }
    if (List.generate(size, (i) => board[i][i]).every((cell) => cell == symbol))
      return true;
    if (List.generate(
      size,
      (i) => board[i][size - 1 - i],
    ).every((cell) => cell == symbol))
      return true;
    return false;
  }

  bool isBoardFull() {
    return board.every((row) => row.every((cell) => cell != ' '));
  }
}
