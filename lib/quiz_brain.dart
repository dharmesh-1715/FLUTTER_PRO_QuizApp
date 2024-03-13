import 'questions.dart';

class Quiz_brain {
  int _count = 0;

  List<Questions> _questionbank = [
    Questions('there are 7 continents in the world', true),
    Questions('Cricket is invented in england', true),
    Questions('Hockey is not indias national game', false),
    Questions('Aeroplane can fly', true),
    Questions('India has worlds largest population', true),
    Questions('India has worlds biggest Enocomy', false),
    Questions('Amazon is the biggest mountain', false),
    Questions('Virat Kohli is the Cricketer', true),
    Questions('ganga starts from Gangotri', true),
    Questions('MS dhoni is the kiving legend', true),
    Questions('India won the 2023 cricket worldcup', false),
    Questions('you are so cute', true)
  ];

  int indicator() {
    return _count;
  }

  void next() {
    if (_count < _questionbank.length - 1) {
      _count++;
    }
  }

  String getQue() {
    return _questionbank[_count].questiontext;
  }

  bool getans() {
    return _questionbank[_count].answer;
  }

  bool isfinished() {
    if (_count >= _questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _count = 0;
  }
}
