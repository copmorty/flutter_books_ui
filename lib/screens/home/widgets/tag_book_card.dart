import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class TagBookCard extends StatelessWidget {
  final Book book;

  const TagBookCard(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/detail', arguments: {'book': book, 'sourceWidgetKey': key}),
      child: Container(
        width: screenWidth * 0.8 + screenHorizontalPadding,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: greyColorOp050,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 15),
            ),
          ],
        ),
        child: Stack(
          children: [
            Hero(
              tag: 'bookCover-${book.id}-$key',
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(blackColorOp015, BlendMode.darken),
                child: Image.asset(
                  book.rawCoverImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: greyColor,
                  colorBlendMode: BlendMode.saturation,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title.toUpperCase(),
                      style: const TextStyle(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 3),
                    const Divider(color: whiteColor, thickness: 1),
                    Text(
                      book.subtitle,
                      style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
