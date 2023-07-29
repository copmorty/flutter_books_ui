import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class DetailBody extends StatelessWidget {
  final Book book;

  const DetailBody(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final title = book.title.replaceFirst(' ', '\n');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding * 2),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.23),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 33, color: whiteColor, fontWeight: FontWeight.w700),
                ),
              ),
              _RatingWidget(book.starRating)
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: screenHeight * 0.125,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                book.description,
                style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RatingWidget extends StatelessWidget {
  final double rating;

  const _RatingWidget(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    final int fiveStarRating = (rating / 2).truncate();

    return Column(
      children: [
        Text(
          rating.toString(),
          style: const TextStyle(fontSize: 25, color: whiteColor, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            for (var i = 0; i < fiveStarRating; i++)
              const Icon(
                Icons.star,
                color: blackColor,
                size: 12,
              ),
            for (var i = 0; i < 5 - fiveStarRating; i++)
              const Icon(
                Icons.star,
                color: whiteColor,
                size: 12,
              ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
