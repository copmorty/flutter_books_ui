import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

class TagFilterChip extends StatelessWidget {
  final String text;
  final bool selected;
  final Function select;

  const TagFilterChip({
    Key? key,
    required this.text,
    required this.selected,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      selectedColor: blackColor,
      backgroundColor: whiteColor,
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: selected ? whiteColor : blackColor,
          fontWeight: FontWeight.w800,
        ),
      ),
      onSelected: (bool selected) => select(),
      side: const BorderSide(color: blackColor, width: 3),
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
