

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Scythelator/generated/l10n.dart';
import 'package:Scythelator/model/ActiveGame.dart';
import 'package:Scythelator/model/Fraction.dart';
import 'package:Scythelator/model/FractionType.dart';


class FractionScreen extends StatefulWidget {
  FractionScreen({Key key, this.activeGame, this.fraction}) : super(key: key);
  final ActiveGame activeGame;
  final Fraction fraction;
  static const String routeName = '/Fraction';
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _FractionScreenState createState() => _FractionScreenState();
}

class _FractionScreenState extends State<FractionScreen> {

  double _starSlider = 0;
  double _popularitySlider = 0;
  FractionType _fractionType;

  final territoriesController = TextEditingController(text: "0");
  final resourcesController = TextEditingController(text: "0");
  final coinsController = TextEditingController(text: "0");
  final buildingBonusController = TextEditingController(text: "0");
  final otherController = TextEditingController(text: "0");

  @override
  void initState(){
    if(widget.fraction != null){
      _starSlider = widget.fraction.stars.toDouble();
      _popularitySlider = widget.fraction.popularity.toDouble();
      _fractionType = widget.fraction.fractionType;
      territoriesController.text = widget.fraction.territories.toString();
      resourcesController.text = widget.fraction.ressourcePairs.toString();
      coinsController.text = widget.fraction.coins.toString();
      buildingBonusController.text = widget.fraction.buildingBonus.toString();
      otherController.text = widget.fraction.other.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    territoriesController.dispose();
    resourcesController.dispose();
    coinsController.dispose();
    buildingBonusController.dispose();
    otherController.dispose();
    super.dispose();
  }

  void saveFraction(){
    if(_fractionType != null) {
      Fraction fraction = new Fraction();
      fraction.fractionType = _fractionType;
      fraction.buildingBonus = int.parse(buildingBonusController.text);
      fraction.coins = int.parse(coinsController.text);
      fraction.ressourcePairs = int.parse(resourcesController.text);
      fraction.stars = _starSlider.toInt();
      fraction.territories = int.parse(territoriesController.text);
      fraction.other = int.parse(otherController.text);
      fraction.popularity = _popularitySlider.toInt();
      widget.activeGame.addFraction(fraction);
      Navigator.of(context).pop();
    }else{
      _showNoFractionAlertDialog();
    }
  }

  void back(){
    if(widget.fraction == null){
      saveFraction();
    }else{
      widget.fraction.buildingBonus = int.parse(buildingBonusController.text);
      widget.fraction.coins = int.parse(coinsController.text);
      widget.fraction.ressourcePairs = int.parse(resourcesController.text);
      widget.fraction.stars = _starSlider.toInt();
      widget.fraction.territories = int.parse(territoriesController.text);
      widget.fraction.other = int.parse(otherController.text);
      widget.fraction.popularity = _popularitySlider.toInt();
      widget.activeGame.editedFractions();
      Navigator.of(context).pop();
    }
  }

  void _showNoFractionAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(S.of(context).noFraction),
          content: Text(S.of(context).chooseFraction),
          actions: <Widget>[
            FlatButton(
              child: Text(S.of(context).leave),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
                child: Text(S.of(context).continue_string),
                onPressed: (){
                  Navigator.of(context).pop();
                }
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // initialiseFraction();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => back(),
        ),
        title: Text(S.of(context).fractionPoints),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child:Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: getFractionLogo(),
                  // FlutterLogo(size: 52.0),
                  title: Text(S.of(context).fraction),
                  subtitle: getFractionSelector(),
                )
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(S.of(context).popularity),
                  subtitle: new Slider(
                    value: _popularitySlider,
                    min: 0,
                    max: 18,
                    divisions: 18,
                    label: _popularitySlider.toString(),
                    onChanged: (double value) {
                      setState(() {
                        _popularitySlider = value;
                      });
                    },
                  ),
                  trailing: Text(_popularitySlider.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text(S.of(context).stars),
                  subtitle: new Slider(
                    value: _starSlider,
                    min: 0,
                    max: 6,
                    divisions: 6,
                    label: _starSlider.toString(),
                    onChanged: (double value) {
                      setState(() {
                        _starSlider = value;
                      });
                    },
                  ),
                  trailing: Text(_starSlider.toString()),
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(Icons.terrain),
                  title: Text(S.of(context).territories),
                  subtitle: new TextField(
                    controller: territoriesController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                )
              ),
              Card(
                  child: ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(S.of(context).coins),
                    subtitle: new TextField(
                      controller: coinsController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  )
              ),
              Card(
                  child: ListTile(
                    leading: Icon(Icons.card_travel),
                    title: Text(S.of(context).resourcePairs),
                    subtitle: new TextField(
                      controller: resourcesController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  )
              ),
              Card(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(S.of(context).buildingBonus),
                    subtitle: new TextField(
                      controller: buildingBonusController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  )
              ),
              Card(
                  child: ListTile(
                    leading: Icon(Icons.adjust),
                    title: Text(S.of(context).otherPointsEgScenarioMarkers),
                    subtitle: new TextField(
                      controller: otherController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  )
              )
            ],
          ),
        )
      ),
    );
  }

  Widget getFractionSelector(){
    if(widget.fraction == null) {
      return DropdownButton<FractionType>(
        value: _fractionType,
        items: widget.activeGame.game.getInactiveFractions().map((
            FractionType value) {
          return new DropdownMenuItem<FractionType>(
            value: value,
            child: new Text(value.toFractionTypeStringInt(context)),
          );
        }).toList(),
        onChanged: (FractionType fractionType) {
          setState(() {
            _fractionType = fractionType;
          });
        },
      );
    }else {
      return Text(_fractionType.toFractionTypeStringInt(context));
    }
  }

  Widget getFractionLogo(){
    if(_fractionType != null)
      return _fractionType.getFractionAvatar(context);
    return Icon(Icons.report_problem);
  }
}