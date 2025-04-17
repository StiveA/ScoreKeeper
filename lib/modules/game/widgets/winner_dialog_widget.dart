import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_theme.dart' show AppTheme;

Future<void> showWinnerDialog({
  required BuildContext context,
  required String winner,
  required VoidCallback onRestart,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (_) => AlertDialog(
          backgroundColor: AppTheme.darkBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Parabéns!",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "$winner venceu a partida 🎉",
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                onRestart();
              },
              child: const Text(
                "Jogar novamente",
                style: TextStyle(color: AppTheme.primary),
              ),
            ),
          ],
        ),
  );
}
