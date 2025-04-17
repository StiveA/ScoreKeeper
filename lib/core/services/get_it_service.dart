import 'package:count_keeper_app/core/services/sound_service.dart';
import 'package:get_it/get_it.dart';
import '../../modules/game/stores/app_settings_store.dart';
import '../../modules/game/stores/game_store.dart';
import '../../modules/game/stores/match_history_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<MatchHistoryStore>(MatchHistoryStore());
  getIt.registerSingleton<AppSettingsStore>(AppSettingsStore());
  getIt.registerSingleton<GameStore>(GameStore(getIt<MatchHistoryStore>()));
  getIt.registerSingleton<SoundService>(SoundService());
}
