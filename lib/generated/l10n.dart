// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `And the winner is...`
  String get andTheWinnerIs {
    return Intl.message(
      'And the winner is...',
      name: 'andTheWinnerIs',
      desc: '',
      args: [],
    );
  }

  /// `No Fraction!`
  String get noFraction {
    return Intl.message(
      'No Fraction!',
      name: 'noFraction',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get leave {
    return Intl.message(
      'Leave',
      name: 'leave',
      desc: '',
      args: [],
    );
  }

  /// `Fraction Points`
  String get fractionPoints {
    return Intl.message(
      'Fraction Points',
      name: 'fractionPoints',
      desc: '',
      args: [],
    );
  }

  /// `Fraction`
  String get fraction {
    return Intl.message(
      'Fraction',
      name: 'fraction',
      desc: '',
      args: [],
    );
  }

  /// `Popularity`
  String get popularity {
    return Intl.message(
      'Popularity',
      name: 'popularity',
      desc: '',
      args: [],
    );
  }

  /// `Stars`
  String get stars {
    return Intl.message(
      'Stars',
      name: 'stars',
      desc: '',
      args: [],
    );
  }

  /// `Territories`
  String get territories {
    return Intl.message(
      'Territories',
      name: 'territories',
      desc: '',
      args: [],
    );
  }

  /// `Coins`
  String get coins {
    return Intl.message(
      'Coins',
      name: 'coins',
      desc: '',
      args: [],
    );
  }

  /// `Resource Pairs`
  String get resourcePairs {
    return Intl.message(
      'Resource Pairs',
      name: 'resourcePairs',
      desc: '',
      args: [],
    );
  }

  /// `Building Bonus`
  String get buildingBonus {
    return Intl.message(
      'Building Bonus',
      name: 'buildingBonus',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `No winner yet`
  String get noWinnerYet {
    return Intl.message(
      'No winner yet',
      name: 'noWinnerYet',
      desc: '',
      args: [],
    );
  }

  /// `Add fraction`
  String get addFraction {
    return Intl.message(
      'Add fraction',
      name: 'addFraction',
      desc: '',
      args: [],
    );
  }

  /// `New Game`
  String get newGame {
    return Intl.message(
      'New Game',
      name: 'newGame',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Choose Fraction`
  String get chooseFraction {
    return Intl.message(
      'Choose Fraction',
      name: 'chooseFraction',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_string {
    return Intl.message(
      'Continue',
      name: 'continue_string',
      desc: '',
      args: [],
    );
  }

  /// `Saxony`
  String get saxony {
    return Intl.message(
      'Saxony',
      name: 'saxony',
      desc: '',
      args: [],
    );
  }

  /// `Crimean`
  String get crimean {
    return Intl.message(
      'Crimean',
      name: 'crimean',
      desc: '',
      args: [],
    );
  }

  /// `Nordic`
  String get nordic {
    return Intl.message(
      'Nordic',
      name: 'nordic',
      desc: '',
      args: [],
    );
  }

  /// `Rusviet`
  String get rusviet {
    return Intl.message(
      'Rusviet',
      name: 'rusviet',
      desc: '',
      args: [],
    );
  }

  /// `Albion`
  String get albion {
    return Intl.message(
      'Albion',
      name: 'albion',
      desc: '',
      args: [],
    );
  }

  /// `Togawa`
  String get togawa {
    return Intl.message(
      'Togawa',
      name: 'togawa',
      desc: '',
      args: [],
    );
  }

  /// `Vesna`
  String get vesna {
    return Intl.message(
      'Vesna',
      name: 'vesna',
      desc: '',
      args: [],
    );
  }

  /// `Fenris`
  String get fenris {
    return Intl.message(
      'Fenris',
      name: 'fenris',
      desc: '',
      args: [],
    );
  }

  /// `Polania`
  String get polania {
    return Intl.message(
      'Polania',
      name: 'polania',
      desc: '',
      args: [],
    );
  }

  /// `Other Points, e.g. scenario markers`
  String get otherPointsEgScenarioMarkers {
    return Intl.message(
      'Other Points, e.g. scenario markers',
      name: 'otherPointsEgScenarioMarkers',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}