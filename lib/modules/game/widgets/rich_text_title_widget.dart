import 'package:flutter/material.dart';

class ColoredLetterText extends StatelessWidget {
  final String text;
  final String highlight;
  final Color highlightColor;
  final TextStyle? baseStyle;

  const ColoredLetterText({
    super.key,
    required this.text,
    required this.highlight,
    required this.highlightColor,
    this.baseStyle,
  });

  @override
  Widget build(BuildContext context) {
    final index = text.indexOf(highlight);
    if (index == -1) {
      return Text(text, style: baseStyle);
    }

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text.substring(0, index), style: baseStyle),
          TextSpan(
            text: text.substring(index, index + highlight.length),
            style:
                baseStyle?.copyWith(color: highlightColor) ??
                TextStyle(color: highlightColor),
          ),
          TextSpan(
            text: text.substring(index + highlight.length),
            style: baseStyle,
          ),
        ],
      ),
    );
  }
}
