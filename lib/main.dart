import 'package:count_keeper_app/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart' show Observer;
import 'package:hive_flutter/hive_flutter.dart';

import 'core/routes/go_router_service.dart';
import 'core/services/get_it_service.dart';
import 'data/models/match_model.dart';
import 'modules/game/stores/app_settings_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MatchModelAdapter());
  await Hive.openBox<MatchModel>('matches');
  await Hive.openBox('app_settings');

  setupLocator();
  runApp(const TrucoScorekeeperApp());
}

class TrucoScorekeeperApp extends StatelessWidget {
  const TrucoScorekeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = getIt<AppSettingsStore>();

    return Observer(
      builder:
          (_) => MaterialApp.router(
            title: 'Truco Scorekeeper',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: settings.themeMode,
            routerConfig: router,
          ),
    );
  }
}
