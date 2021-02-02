import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Scythelator/model/ActiveGame.dart';
import 'package:Scythelator/model/Fraction.dart';
import 'package:Scythelator/model/FractionType.dart';
import 'package:Scythelator/screens/FractionScreen.dart';

class FractionTile extends StatelessWidget {
  FractionTile({Key key, this.fraction, this.activeGame}) : super(key: key);
  final Fraction fraction;
  final ActiveGame activeGame;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: fraction.fractionType.getFractionAvatar(context),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _title(fraction.fractionType.toFractionTypeStringInt(context),
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Row(children: [
                    IconButton(
                        onPressed: () => activeGame.deleteFraction(fraction),
                        icon: Icon(Icons.delete),
                        tooltip: "Delete Fraction"),
                    IconButton(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FractionScreen(
                                    activeGame: activeGame,
                                    fraction: fraction,
                                  )
                              ),
                            ),
                        icon: Icon(Icons.edit),
                        tooltip: "Edit Fraction"),
                  ])
                ]),
            subtitle: Column(
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(children: [
                      Icon(Icons.favorite),
                      Text(fraction.popularity.toString())
                    ]),
                    Column(children: [
                      Icon(Icons.star),
                      Text(fraction.stars.toString())
                    ]),
                    Column(children: [
                      Icon(Icons.terrain),
                      Text(fraction.territories.toString())
                    ]),
                    Column(children: [
                      Icon(Icons.card_travel),
                      Text(fraction.ressourcePairs.toString())
                    ]),
                    Column(children: [
                      Icon(Icons.attach_money),
                      Text(fraction.coins.toString())
                    ]),
                    Column(children: [
                      Icon(Icons.home),
                      Text(fraction.buildingBonus.toString())
                    ]),
                    Column(children: [
                      Icon(Icons.adjust),
                      Text(fraction.other.toString())
                    ]),
                    VerticalDivider(
                      color: Colors.black,
                    ),
                    Column(children: [
                      Icon(Icons.monetization_on),
                      Text(fraction.getPoints().toString())
                    ]),
                  ],
                )
              ],
            )
        )
    );
  }

  Widget _title(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
