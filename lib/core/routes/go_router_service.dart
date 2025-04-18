import 'package:go_router/go_router.dart';

import '../../modules/game/views/history_view.dart';
import '../../modules/game/views/new_match_view.dart';
import '../../modules/game/views/score_keeper_view.dart';
import '../../modules/game/views/settings_view.dart';
import '../../modules/game/views/splash_view.dart';
import '../../modules/game/views/stats_view.dart';
import '../../modules/game/widgets/main_navigation_widget.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashView()),
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigation(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'scorekeeper',
          builder: (context, state) => ScorekeeperView(),
        ),
        GoRoute(
          path: '/new-match',
          name: 'new_match',
          builder: (context, state) => const NewMatchView(),
        ),
        GoRoute(
          path: '/history',
          name: 'history',
          builder: (context, state) => HistoryView(),
        ),
        GoRoute(
          path: '/stats',
          name: 'stats',
          builder: (context, state) => const StatsView(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => SettingsView(),
        ),
      ],
    ),
  ],
);
