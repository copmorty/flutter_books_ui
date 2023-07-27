import 'package:flutter/material.dart';
import 'package:flutter_books_ui/screens/home/widgets/popular_book_card.dart';
import 'package:flutter_books_ui/shared/data/data_source.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: 15)),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) => PopularBookWidget(popularBooks[i]),
            separatorBuilder: (context, i) => const SizedBox(width: 20),
            itemCount: popularBooks.length,
          ),
        ),
      ],
    );
  }
}
