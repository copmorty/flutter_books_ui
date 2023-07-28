import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';

class LikedBookWidget extends StatelessWidget {
  final Book book;

  const LikedBookWidget(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 65,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: blackColorOp030,
                    spreadRadius: -5,
                    blurRadius: 20,
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
                ],
              ),
            ),
          ),
          const Spacer(flex: 10),
          Expanded(
            flex: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  'By ${book.author}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, color: whiteColorOp054, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
