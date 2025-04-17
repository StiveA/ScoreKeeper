import 'package:count_keeper_app/modules/game/widgets/rich_text_title_widget.dart'
    show ColoredLetterText;
import 'package:flutter/material.dart';

import '../../../core/constants/app_theme.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,

      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 48.0),
              child: ColoredLetterText(
                text: "ScoreKeeper",
                highlight: "K",
                highlightColor: Colors.red,
                baseStyle: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/rules.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
