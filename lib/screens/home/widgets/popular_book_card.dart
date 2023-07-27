import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/helpers/custom_icon_font.dart';

class PopularBookWidget extends StatelessWidget {
  final Book book;

  const PopularBookWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      child: Column(
        children: [
          Container(
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: greyColorOp050,
                  spreadRadius: -5,
                  blurRadius: 10,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: Stack(
              children: [
                Image.asset(
                  book.coverImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: greyColor,
                  colorBlendMode: BlendMode.saturation,
                ),
                const Positioned(
                  top: -5,
                  right: -10,
                  child: Stack(
                    children: [
                      Icon(CustomIconFont.cleanbookmark, color: whiteColor, size: 50),
                      Icon(CustomIconFont.fancyBookmark, size: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                'By ${book.author}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: greyColor, fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}
