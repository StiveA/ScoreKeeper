// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchHistoryStore on _MatchHistoryStoreBase, Store {
  late final _$historyAtom =
      Atom(name: '_MatchHistoryStoreBase.history', context: context);

  @override
  ObservableList<MatchModel> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<MatchModel> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$_MatchHistoryStoreBaseActionController =
      ActionController(name: '_MatchHistoryStoreBase', context: context);

  @override
  void addMatch(MatchModel match) {
    final _$actionInfo = _$_MatchHistoryStoreBaseActionController.startAction(
        name: '_MatchHistoryStoreBase.addMatch');
    try {
      return super.addMatch(match);
    } finally {
      _$_MatchHistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_MatchHistoryStoreBaseActionController.startAction(
        name: '_MatchHistoryStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_MatchHistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
history: ${history}
    ''';
  }
}
