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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;

          return Stack(
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
                  final hasWinner = _store.scoreUs >= _store.maxPoints || _store.scoreThem >= _store.maxPoints;
                  final winnerName = _store.scoreUs >= _store.maxPoints
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

                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: screenHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.04),
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
                            SizedBox(height: screenHeight * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _scoreCard(_store.teamUs, _store.scoreUs, screenWidth),
                                _scoreCard(_store.teamThem, _store.scoreThem, screenWidth),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    _roundIconButton(Icons.add, () => _store.incrementUs(), screenWidth),
                                    const SizedBox(height: 12),
                                    _roundIconButton(Icons.remove, () {
                                      if (_store.scoreUs > 0) _store.scoreUs--;
                                    }, screenWidth),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _roundIconButton(Icons.add, () => _store.incrementThem(), screenWidth),
                                    const SizedBox(height: 12),
                                    _roundIconButton(Icons.remove, () {
                                      if (_store.scoreThem > 0) _store.scoreThem--;
                                    }, screenWidth),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                              child: ElevatedButton(
                                onPressed: _store.reset,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                  child: Text(
                                    "NOVA PARTIDA",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget _scoreCard(String label, int score, double screenWidth) {
  return Container(
    width: screenWidth * 0.38,
    height: screenWidth * 0.5,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
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

Widget _roundIconButton(IconData icon, VoidCallback onTap, double screenWidth) {
  final size = screenWidth * 0.18;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Icon(icon, size: 24, color: AppTheme.primary),
    ),
  );
}
}