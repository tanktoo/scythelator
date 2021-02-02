import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Scythelator/generated/l10n.dart';
import 'package:Scythelator/model/ActiveGame.dart';
import 'package:Scythelator/model/Fraction.dart';
import 'package:Scythelator/model/FractionType.dart';
import 'package:Scythelator/screens/FractionScreen.dart';
import 'package:Scythelator/widget/fractionTile.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key key, this.activeGame}) : super(key: key);
  static const String routeName = '/';
  final ActiveGame activeGame;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  void _calculate() {
    Fraction winnerFraction = widget.activeGame.getWinner();
    if(winnerFraction != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(S.of(context).andTheWinnerIs),
              content: Text(widget.activeGame
                  .getWinner()
                  .fractionType
                  .toFractionTypeStringInt(context)),
              actions: [
                FlatButton(
                  child: Text(S.of(context).close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }else{
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(S.of(context).andTheWinnerIs),
              content: Text(S.of(context).noWinnerYet),
              actions: [
                FlatButton(
                  child: Text(S.of(context).close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scythelator"),
      ),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.activeGame.game.fractions.length,
          itemBuilder: (context, index) {
            return FractionTile(
              fraction: widget.activeGame.game.fractions[index],
              activeGame: widget.activeGame
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: Icon(Icons.add),
        label: Text(S.of(context).addFraction),
        onPressed: () => newFraction(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            getMenuPopupButton(),
            IconButton(
              icon: Icon(Icons.beenhere),
              onPressed: () => _calculate(),
            )
          ],
        ),
      ),
      // drawer: AppDrawer(),
    );
  }

  void newFraction() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FractionScreen(
                activeGame: widget.activeGame,
                fraction: null,
              )),
    );
  }

  Widget getMenuPopupButton() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(S.of(context).newGame),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(S.of(context).about),
        ),
      ],
      icon: Icon(Icons.menu),
      offset: Offset(0, 0),
      onSelected: (value) {
        switch (value) {
          case 1:
            widget.activeGame.newGame();
            break;
          case 2:
            showAboutDialog(
                context: context,
                applicationVersion: "0.1",
                applicationIcon: Icon(Icons.favorite),
                applicationName: "Scythelator",
                children: [Text("by tanktoo")]);
            break;
        }
      },
    );
  }
}
