// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStoreBase, Store {
  late final _$teamUsAtom =
      Atom(name: '_GameStoreBase.teamUs', context: context);

  @override
  String get teamUs {
    _$teamUsAtom.reportRead();
    return super.teamUs;
  }

  @override
  set teamUs(String value) {
    _$teamUsAtom.reportWrite(value, super.teamUs, () {
      super.teamUs = value;
    });
  }

  late final _$teamThemAtom =
      Atom(name: '_GameStoreBase.teamThem', context: context);

  @override
  String get teamThem {
    _$teamThemAtom.reportRead();
    return super.teamThem;
  }

  @override
  set teamThem(String value) {
    _$teamThemAtom.reportWrite(value, super.teamThem, () {
      super.teamThem = value;
    });
  }

  late final _$scoreUsAtom =
      Atom(name: '_GameStoreBase.scoreUs', context: context);

  @override
  int get scoreUs {
    _$scoreUsAtom.reportRead();
    return super.scoreUs;
  }

  @override
  set scoreUs(int value) {
    _$scoreUsAtom.reportWrite(value, super.scoreUs, () {
      super.scoreUs = value;
    });
  }

  late final _$scoreThemAtom =
      Atom(name: '_GameStoreBase.scoreThem', context: context);

  @override
  int get scoreThem {
    _$scoreThemAtom.reportRead();
    return super.scoreThem;
  }

  @override
  set scoreThem(int value) {
    _$scoreThemAtom.reportWrite(value, super.scoreThem, () {
      super.scoreThem = value;
    });
  }

  late final _$maxPointsAtom =
      Atom(name: '_GameStoreBase.maxPoints', context: context);

  @override
  int get maxPoints {
    _$maxPointsAtom.reportRead();
    return super.maxPoints;
  }

  @override
  set maxPoints(int value) {
    _$maxPointsAtom.reportWrite(value, super.maxPoints, () {
      super.maxPoints = value;
    });
  }

  late final _$_GameStoreBaseActionController =
      ActionController(name: '_GameStoreBase', context: context);

  @override
  void startMatch(String us, String them, int max) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.startMatch');
    try {
      return super.startMatch(us, them, max);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementUs() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.incrementUs');
    try {
      return super.incrementUs();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementThem() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.incrementThem');
    try {
      return super.incrementThem();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
teamUs: ${teamUs},
teamThem: ${teamThem},
scoreUs: ${scoreUs},
scoreThem: ${scoreThem},
maxPoints: ${maxPoints}
    ''';
  }
}
