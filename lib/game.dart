import 'dart:math';

class Game {  // camel case
  int? maxRandom;
  int? _answer;     //  _ หน้าตัวแปรคือ private (private ของตัว package)
  int _gcount = 0;
  static List<int> myList = [];


  Game({int maxRandom = 100}){
    this.maxRandom = maxRandom;
    var r = Random();
    _answer = r.nextInt(maxRandom) + 1;
  }

  int get gcount {
    return _gcount; //เอาตัวแปร private มาใช้ใน guess_number.dart
  }

  int doGuess(int num) {
    //ทายถูก return 0
    //มากไป return 1
    //น้อยไป return -1
    if(num > _answer!){
      _gcount++;
      return 1;
    }
    else if(num < _answer!){
      _gcount++;
      return -1;
    }
    else {
      _gcount++;
      return 0;
    }
  }
}