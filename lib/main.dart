import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:Scythelator/screens/GameScreen.dart';

import 'generated/l10n.dart';
import 'model/ActiveGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ActiveGame>(create: (context) => ActiveGame())
      ],
      child: MaterialApp(
        title: 'Scythelator',

        localizationsDelegates: [
          const AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('de', ''),
        ],

        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          GameScreen.routeName: (context) => new Consumer<ActiveGame>(
            builder: (context, activeGame, child){
              return GameScreen(activeGame: activeGame);
            },
          ),
        },
      ),
    );
  }
}

