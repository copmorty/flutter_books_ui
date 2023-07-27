import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/widgets/divider_stroke.dart';
import 'package:flutter_books_ui/shared/widgets/text_stroke.dart';

class TagBookCard extends StatelessWidget {
  final Book book;
  const TagBookCard(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
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
            book.rawCoverImage,
            width: double.infinity,
            fit: BoxFit.cover,
            color: greyColor,
            colorBlendMode: BlendMode.saturation,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStroke(
                    book.title.toUpperCase(),
                    style: const TextStyle(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w800),
                    strokeColor: blackColor,
                    strokeWidth: 0.2,
                  ),
                  const DividerStroke(
                    thickness: 1.5,
                    color: whiteColor,
                    strokeWidth: 0.2,
                    strokeColor: blackColor,
                  ),
                  TextStroke(
                    book.subtitle,
                    style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w800),
                    strokeColor: blackColor,
                    strokeWidth: 0.2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
