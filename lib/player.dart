import 'dart:io';

class Player {
  final String symbol;

  Player(this.symbol);

  void makeMove(List<List<String>> board, int size) {
    while (true) {
      print('Игрок $symbol, введите номер строки (1-$size): ');
      int? row = int.tryParse(stdin.readLineSync() ?? '');
      print('Игрок $symbol, введите номер столбца (1-$size): ');
      int? col = int.tryParse(stdin.readLineSync() ?? '');

      if (row != null &&
          col != null &&
          row >= 1 &&
          row <= size &&
          col >= 1 &&
          col <= size) {
        row -= 1;
        col -= 1;
        if (board[row][col] == ' ') {
          board[row][col] = symbol;
          break;
        } else {
          print('Клетка занята, попробуйте снова!');
        }
      } else {
        print('Неверный ход, введите числа от 1 до $size!');
      }
    }
  }
}
