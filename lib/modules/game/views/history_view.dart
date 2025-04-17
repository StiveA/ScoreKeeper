import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_theme.dart';
import '../../../core/services/get_it_service.dart';
import '../stores/match_history_store.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final MatchHistoryStore _historyStore = getIt<MatchHistoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppTheme.darkBackground,
            pinned: true,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Histórico de Partidas"),
              titlePadding: EdgeInsets.only(left: 16, bottom: 12),
            ),
          ),
          Observer(
            builder: (_) {
              if (_historyStore.history.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Nenhuma partida registrada ainda.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final match = _historyStore.history[index];
                    final isWin = match.scoreUs > match.scoreThem;
                    final result = isWin ? "Vitória de Nós" : "Vitória de Eles";
                    final formattedDate =
                        DateFormat("dd/MM/yyyy").format(match.date);

                    return Card(
                      color: Colors.grey[900],
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(
                          "${match.teamUs} ${match.scoreUs} x ${match.scoreThem} ${match.teamThem}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "$result • $formattedDate",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    );
                  },
                  childCount: _historyStore.history.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
