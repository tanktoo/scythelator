
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Scythelator/generated/l10n.dart';


enum FractionType {
  Polania,
  Saxony,
  Crimean,
  Nordic,
  Rusviet,
  Albion,
  Togawa,
  Vesna,
  Fenris
}

extension FractionTypeExtension on FractionType {

  String toFractionTypeStringInt(BuildContext context) {
    switch (this) {
      case FractionType.Polania:
        return S.of(context).polania;
      case FractionType.Saxony:
        return S.of(context).saxony;
      case FractionType.Crimean:
        return S.of(context).crimean;
      case FractionType.Nordic:
        return S.of(context).nordic;
      case FractionType.Rusviet:
        return S.of(context).rusviet;
      case FractionType.Albion:
        return S.of(context).albion;
      case FractionType.Togawa:
        return S.of(context).togawa;
      case FractionType.Vesna:
        return S.of(context).vesna;
      case FractionType.Fenris:
        return S.of(context).fenris;
    }
    return "";
  }
  
  String toFractionTypeString() {
    switch (this) {
      case FractionType.Polania:
        return 'Polania';
      case FractionType.Saxony:
        return 'Saxony';
      case FractionType.Crimean:
        return 'Crimean';
      case FractionType.Nordic:
        return 'Nordic';
      case FractionType.Rusviet:
        return 'Rusviet';
      case FractionType.Albion:
        return 'Albion';
      case FractionType.Togawa:
        return 'Togawa';
      case FractionType.Vesna:
        return 'Vesna';
      case FractionType.Fenris:
        return 'Fenris';
    }
    return "";
  }

  Color getFractionBackgroundColor() {
    switch (this) {
      case FractionType.Polania:
        return Color(0xFFFDFFFF);
      case FractionType.Saxony:
        return Color(0xFF212324);
      case FractionType.Crimean:
        return Color(0xFFFFA321);
      case FractionType.Nordic:
        return Color(0xFF2BBEE1);
      case FractionType.Rusviet:
        return Color(0xFFFF0000);
      case FractionType.Albion:
        return Color(0xFF1E4614);
      case FractionType.Togawa:
        return Color(0xFF620A94);
      case FractionType.Vesna:
        return Color(0xFF6CCCD8);
      case FractionType.Fenris:
        return Color(0xFFED8F4F);
    }
    return Color(0xFF42A5F5);
  }

  Color getFractionTextColor() {
    switch (this) {
      case FractionType.Polania:
        return Color(0xFFC80706);
      case FractionType.Saxony:
        return Color(0xFFFFDC37);
      case FractionType.Crimean:
        return Color(0xFF4C582C);
      case FractionType.Nordic:
        return Color(0xFF05598D);
      case FractionType.Rusviet:
        return Color(0xFF972928);
      case FractionType.Albion:
        return Color(0xFF815305);
      case FractionType.Togawa:
        return Color(0xFFF3F2F7);
      case FractionType.Vesna:
        return Color(0xFF753E39);
      case FractionType.Fenris:
        return Color(0xFF0A0603);
    }
    return Colors.black;
  }
  Widget getFractionAvatar(BuildContext context) {
    return CircleAvatar(
        backgroundColor: this.getFractionBackgroundColor(),
        child: Text(
            this.toFractionTypeStringInt(context).substring(0, 1),
            style: TextStyle(
                color: this.getFractionTextColor(),
                fontWeight: FontWeight.bold)
        ),
    );
  }
}