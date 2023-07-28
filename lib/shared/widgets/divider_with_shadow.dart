import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

@Deprecated('Will be removed')
class DividerWithShadow extends StatelessWidget {
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  const DividerWithShadow({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
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
      child: Divider(
        height: height,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: color,
      ),
    );
  }
}
