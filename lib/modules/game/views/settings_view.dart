import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/constants/app_theme.dart';
import '../../../core/services/get_it_service.dart';
import '../stores/app_settings_store.dart';
import '../stores/match_history_store.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final AppSettingsStore _settings = getIt<AppSettingsStore>();
  final MatchHistoryStore _history = getIt<MatchHistoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Configurações"),
      ),
      body: Observer(
        builder: (_) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            SwitchListTile(
              title: const Text("Ativar sons"),
              subtitle: const Text("Reproduz efeitos sonoros durante o jogo"),
              value: _settings.soundEnabled,
              onChanged: _settings.toggleSound,
              activeColor: AppTheme.primary,
            ),
            const Divider(color: Colors.white24),
            SwitchListTile(
              title: const Text("Tema escuro"),
              subtitle: const Text("Atualmente fixo"),
              value: _settings.darkThemeEnabled,
              onChanged: _settings.toggleTheme,
              activeColor: AppTheme.primary,
            ),
            const Divider(color: Colors.white24),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _history.clear();
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text("Limpar histórico"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
