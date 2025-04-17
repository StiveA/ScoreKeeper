import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/constants/app_theme.dart';
import '../../../core/services/get_it_service.dart';
import '../stores/game_store.dart';
import '../widgets/rich_text_title_widget.dart';
import '../widgets/winner_dialog_widget.dart';

class ScorekeeperView extends StatelessWidget {
  final GameStore _store = getIt<GameStore>();

  ScorekeeperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/scaffoldImage.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Observer(
              builder: (_) {
                final hasWinner =
                    _store.scoreUs >= _store.maxPoints ||
                    _store.scoreThem >= _store.maxPoints;
                final winnerName =
                    _store.scoreUs >= _store.maxPoints
                        ? _store.teamUs
                        : _store.scoreThem >= _store.maxPoints
                        ? _store.teamThem
                        : null;

                if (hasWinner && winnerName != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showWinnerDialog(
                      context: context,
                      winner: winnerName,
                      onRestart: _store.reset,
                    );
                  });
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    const ColoredLetterText(
                      text: "ScoreKeeper",
                      highlight: "K",
                      highlightColor: Colors.red,
                      baseStyle: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "Truco",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _scoreCard(_store.teamUs, _store.scoreUs),
                          _scoreCard(_store.teamThem, _store.scoreThem),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _roundIconButton(
                                Icons.add,
                                () => _store.incrementUs(),
                              ),
                              const SizedBox(height: 12),
                              _roundIconButton(Icons.remove, () {
                                if (_store.scoreUs > 0) _store.scoreUs--;
                              }),
                            ],
                          ),
                          Column(
                            children: [
                              _roundIconButton(
                                Icons.add,
                                () => _store.incrementThem(),
                              ),
                              const SizedBox(height: 12),
                              _roundIconButton(Icons.remove, () {
                                if (_store.scoreThem > 0) _store.scoreThem--;
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: ElevatedButton(
                        onPressed: _store.reset,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          child: Text(
                            "NOVA PARTIDA",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _scoreCard(String label, int score) {
    return Container(
      width: 140,
      height: 230,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            '$score',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _roundIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: Icon(icon, size: 24, color: AppTheme.primary),
      ),
    );
  }
}
