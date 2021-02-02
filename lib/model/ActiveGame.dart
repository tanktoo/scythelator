
import 'package:flutter/cupertino.dart';

import 'Fraction.dart';
import 'Game.dart';

//https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd
class ActiveGame with ChangeNotifier{
  ActiveGame(){
    this._game = new Game();
  }

  newGame(){
    this._game = new Game();
    notifyListeners();
  }

  Game _game;

  Game get game => _game;

  set game(Game game) {
    _game = game;
    notifyListeners();
  }

  Fraction getWinner() {
    return this._game.getWinner();
  }

  deleteFraction(Fraction fraction){
    _game.deleteFraction(fraction);
    notifyListeners();
  }

  addFraction(Fraction fraction){
    _game.fractions.add(fraction);
    notifyListeners();
  }

  editedFractions(){
    notifyListeners();
  }
}