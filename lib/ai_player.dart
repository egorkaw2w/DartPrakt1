import 'dart:math';
import 'player.dart';

class AiPlayer extends Player {
  AiPlayer(String symbol) : super(symbol);

  @override
  void makeMove(List<List<String>> board, int size) {
    while (true) {
      int row = Random().nextInt(size);
      int col = Random().nextInt(size);
      if (board[row][col] == ' ') {
        board[row][col] = symbol;
        print('Робот $symbol выбрал: ${row + 1}, ${col + 1}');
        break;
      }
    }
  }
}
