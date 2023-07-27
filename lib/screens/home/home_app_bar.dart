import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/helpers/custom_icon_font.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(CustomIconFont.fancyMenu, size: 30)),
        ],
      ),
    );
  }
}
