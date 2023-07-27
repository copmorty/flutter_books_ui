import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

@Deprecated('Will be removed')
class DividerStroke extends StatelessWidget {
  final double? thickness;
  final Color? color;
  final Color? strokeColor;
  final double? strokeWidth;

  const DividerStroke({
    super.key,
    this.thickness,
    this.color,
    this.strokeColor,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final dividerThickness = thickness ?? 1;
    final strokeThickness = dividerThickness + (strokeWidth ?? 0);

    return Stack(
      children: [
        Center(
          child: Divider(
            color: strokeColor ?? redColor,
            thickness: strokeThickness,
          ),
        ),
        Center(
          child: Divider(
            indent: strokeWidth,
            endIndent: strokeWidth,
            color: color ?? blackColor,
            thickness: dividerThickness,
          ),
        ),
      ],
    );
  }
}
