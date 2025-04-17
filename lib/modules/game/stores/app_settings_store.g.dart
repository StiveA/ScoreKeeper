// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppSettingsStore on _AppSettingsStoreBase, Store {
  late final _$soundEnabledAtom =
      Atom(name: '_AppSettingsStoreBase.soundEnabled', context: context);

  @override
  bool get soundEnabled {
    _$soundEnabledAtom.reportRead();
    return super.soundEnabled;
  }

  @override
  set soundEnabled(bool value) {
    _$soundEnabledAtom.reportWrite(value, super.soundEnabled, () {
      super.soundEnabled = value;
    });
  }

  late final _$darkThemeEnabledAtom =
      Atom(name: '_AppSettingsStoreBase.darkThemeEnabled', context: context);

  @override
  bool get darkThemeEnabled {
    _$darkThemeEnabledAtom.reportRead();
    return super.darkThemeEnabled;
  }

  @override
  set darkThemeEnabled(bool value) {
    _$darkThemeEnabledAtom.reportWrite(value, super.darkThemeEnabled, () {
      super.darkThemeEnabled = value;
    });
  }

  late final _$_AppSettingsStoreBaseActionController =
      ActionController(name: '_AppSettingsStoreBase', context: context);

  @override
  void toggleSound(bool value) {
    final _$actionInfo = _$_AppSettingsStoreBaseActionController.startAction(
        name: '_AppSettingsStoreBase.toggleSound');
    try {
      return super.toggleSound(value);
    } finally {
      _$_AppSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTheme(bool value) {
    final _$actionInfo = _$_AppSettingsStoreBaseActionController.startAction(
        name: '_AppSettingsStoreBase.toggleTheme');
    try {
      return super.toggleTheme(value);
    } finally {
      _$_AppSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
soundEnabled: ${soundEnabled},
darkThemeEnabled: ${darkThemeEnabled}
    ''';
  }
}
