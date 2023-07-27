import 'package:flutter/material.dart';
import 'package:flutter_books_ui/screens/home/widgets/tag_book_card.dart';
import 'package:flutter_books_ui/screens/home/widgets/tag_filter_chip.dart';
import 'package:flutter_books_ui/shared/data/data_source.dart';
import 'package:flutter_books_ui/shared/data/enums.dart';
import 'package:flutter_books_ui/shared/helpers/no_glow_scroll_behavior.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  Tag _selectedTag = Tag.recommended;

  void _selectTag(Tag tag) async {
    setState(() {
      _selectedTag = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.096,
          child: ScrollConfiguration(
            behavior: const NoGlowScrollBehavior(),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => TagFilterChip(
                text: Tag.values[i].capitalizedName(),
                selected: Tag.values[i] == _selectedTag,
                select: () => _selectTag(Tag.values[i]),
              ),
              separatorBuilder: (context, i) => const SizedBox(width: 10),
              itemCount: Tag.values.length,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.268,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(screenHorizontalPadding, 10, screenHorizontalPadding, 40),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) => TagBookCard(filteredBooks[_selectedTag]![i]),
            separatorBuilder: (context, i) => const SizedBox(width: 20),
            itemCount: filteredBooks[_selectedTag]!.length,
          ),
        ),
      ],
    );
  }
}
