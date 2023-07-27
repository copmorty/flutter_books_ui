import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

class TextStroke extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? strokeWidth;
  final Color? strokeColor;

  const TextStroke(
    this.text, {
    super.key,
    this.style,
    this.strokeWidth,
    this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    const defaultStyle = TextStyle(fontSize: 14, color: whiteColor);
    final textStyle = style ?? defaultStyle;

    return Stack(
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Text(
          text,
          style: textStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 1
              ..color = strokeColor ?? redColor,
          ),
        ),
      ],
    );
  }
}
