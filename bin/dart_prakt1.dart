import 'dart:io';
import 'package:dart_prakt1/game.dart';

void main() {
  while (true) {
    int? size;
    while (true) {
      print('Введите размер игрового поля (2, 3 или 4): ');
      String? input = stdin.readLineSync();
      size = int.tryParse(input ?? '');
      if (size != null && size >= 2 && size <= 4) break;
      print('Пожалуйста, введите число 2, 3 или 4!');
    }
    Game game = Game(size);

    print('Выберите режим игры:');
    print('1 - Игра друг против друга');
    print('2 - Игра против робота');
    int? mode;
    while (true) {
      String? input = stdin.readLineSync();
      mode = int.tryParse(input ?? '');
      if (mode == 1 || mode == 2) break;
      print('Пожалуйста, введите 1 или 2!');
    }

    if (mode == 2) {
      game.setAiMode();
    }

    game.start();

    print('Хотите продолжить?');
    print('1 - Да, хочу продолжить');
    print('2 - Нет');
    int? playAgain;
    while (true) {
      String? input = stdin.readLineSync();
      playAgain = int.tryParse(input ?? '');
      if (playAgain == 1 || playAgain == 2) break;
      print('Пожалуйста, введите 1 или 2!');
    }

    if (playAgain == 2) break;
  }
}
