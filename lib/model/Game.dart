

import 'Fraction.dart';
import 'FractionType.dart';

class Game {
  int id;
  List<Fraction> _fractions = new List<Fraction>();

  List<Fraction> get fractions {
    _fractions.sort((b, a) => a.getPoints().compareTo(b.getPoints()));
    return _fractions;
  }

  List<Fraction> getResults(){
    this.fractions.sort((a, b) => a.getPoints().compareTo(b.getPoints()));
    return this.fractions;
  }

  Fraction getWinner(){
    if(this._fractions.length >= 1)
      return this.fractions.first;
    else
      return null;
  }

  List<FractionType> getInactiveFractions(){
    List<FractionType> inactiveFractions = new List<FractionType>();
    FractionType.values.forEach((value) => isFractionActive(value) ? null : inactiveFractions.add(value));
    return inactiveFractions;
  }

  bool isFractionActive(FractionType fractionType){
    for (Fraction fraction in this.fractions) {
      if (fraction.fractionType == fractionType)
        return true;
    }
    return false;
  }

  void deleteFraction(Fraction fraction){
    this.fractions.remove(fraction);
  }
}