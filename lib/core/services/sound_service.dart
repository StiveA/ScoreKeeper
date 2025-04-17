import 'package:audioplayers/audioplayers.dart';

import '../../modules/game/stores/app_settings_store.dart';
import 'get_it_service.dart';

class SoundService {
  final AudioPlayer _player = AudioPlayer();
  final AppSettingsStore _settings = getIt<AppSettingsStore>();

  Future<void> playClick() async {
    if (_settings.soundEnabled) {
      await _player.play(AssetSource('sounds/click.wav'), volume: 0.5);
    }
  }

  Future<void> playReset() async {
    if (_settings.soundEnabled) {
      await _player.play(AssetSource('sounds/reset.wav'), volume: 0.5);
    }
  }
}
