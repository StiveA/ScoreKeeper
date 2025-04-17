import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'app_settings_store.g.dart';

class AppSettingsStore = _AppSettingsStoreBase with _$AppSettingsStore;

abstract class _AppSettingsStoreBase with Store {
  late Box _settingsBox;

  @observable
  bool soundEnabled = true;

  @observable
  bool darkThemeEnabled = true;

  ThemeMode get themeMode =>
      darkThemeEnabled ? ThemeMode.dark : ThemeMode.light;

  _AppSettingsStoreBase() {
    _init();
  }

  Future<void> _init() async {
    _settingsBox = await Hive.openBox('app_settings');
    soundEnabled = _settingsBox.get('soundEnabled', defaultValue: true);
    darkThemeEnabled = _settingsBox.get('darkThemeEnabled', defaultValue: true);
  }

  @action
  void toggleSound(bool value) {
    soundEnabled = value;
    _settingsBox.put('soundEnabled', value);
  }

  @action
  void toggleTheme(bool value) {
    darkThemeEnabled = value;
    _settingsBox.put('darkThemeEnabled', value);
  }
}
