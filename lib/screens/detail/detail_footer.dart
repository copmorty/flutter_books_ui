import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/widgets/leading_rotation_widget.dart';
import 'package:flutter_books_ui/screens/detail/widgets/liked_book_widget.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/data_source.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class DetailFooter extends StatelessWidget {
  final ValueNotifier<double> _scrollNotifier = ValueNotifier<double>(0);

  DetailFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHorizontalPadding * 2),
          child: Text(
            'Most likes',
            style: TextStyle(fontSize: 18, color: whiteColor, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: screenHeight * 0.278,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                _scrollNotifier.value = scrollNotification.metrics.pixels;
              }
              return false;
            },
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding * 2),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) => LeadingRotationWidget(
                scrollNotifier: _scrollNotifier,
                startOffset: screenHorizontalPadding * 1.5,
                child: LikedBookWidget(mostLikedBooks[i]),
              ),
              separatorBuilder: (context, i) => const SizedBox(width: 20),
              itemCount: mostLikedBooks.length,
            ),
          ),
        ),
      ],
    );
  }
}
