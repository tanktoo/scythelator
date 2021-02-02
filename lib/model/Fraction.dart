
import 'FractionType.dart';

class Fraction {
  FractionType fractionType;
  int stars;
  int coins;
  int territories;
  int popularity;
  int ressourcePairs;
  int buildingBonus;
  int other;

  int getPoints() {
    if (this.popularity >= 13){
      return 5 * this.stars + 4 * this.territories + 3 * this.ressourcePairs + this.coins + this.buildingBonus + this.other;
    }
    else if (this.popularity >= 7) {
      return 4 * this.stars + 3 * this.territories + 2 * this.ressourcePairs + this.coins + this.buildingBonus + this.other;
    }
    else {
      return 3 * this.stars + 2 * this.territories + 1 * this.ressourcePairs + this.coins + this.buildingBonus + this.other;
    }
  }
}