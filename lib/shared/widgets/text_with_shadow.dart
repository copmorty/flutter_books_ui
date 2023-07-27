import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

class TextWithShadow extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextWithShadow(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColorOp010,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
