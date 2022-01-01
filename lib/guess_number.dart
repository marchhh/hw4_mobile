// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';
import 'game.dart';

void main() {

  while(true){
    stdout.write('\nEnter a maximum number to random: ');
    var randomx = int.tryParse(stdin.readLineSync()!);

    if(randomx == null){
      continue;
    }
    var game = Game(maxRandom: randomx);
    print('\n╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');
    var guessCount = 0;
    var isCorrect = false;
    do {
      stdout.write('║ Guess the number between 1 and ${game.maxRandom}: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null) {
        continue;
      }

      var result = game.doGuess(guess);
      var c = game.gcount;

      if (result == 1) {
        print('║ ➜ $guess is TOO HIGH! ▲');
        print('╟────────────────────────────────────────');
      } else if (result == -1) {
        print('║ ➜ $guess is TOO LOW! ▼');
        print('╟────────────────────────────────────────');
      } else {
        print('║ ➜ $guess is CORRECT ❤, total guesses: $c');
        print('╟────────────────────────────────────────');
        Game.myList.add(c);
        isCorrect = true;
      }
    } while (!isCorrect);

    print('║                 THE END                ');
    print('╚════════════════════════════════════════');

    var get = "";
    while(true){
      stdout.write('play again? (Y/N): ');
      get = stdin.readLineSync()!;
      if(get.toUpperCase()=='Y'){
        break;
      }
      else if(get.toUpperCase()=='N'){
        print("\n\nYou've played ${Game.myList.length} games");
        for(int i=0; i<Game.myList.length; i++){
          print('🚀 Game #${i+1}: ${Game.myList[i]} guesses');
        }
        exit (0);
      }
    }
    game = Game();
  }
}