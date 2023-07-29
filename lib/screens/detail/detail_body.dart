import 'package:flutter/material.dart';
import 'package:flutter_books_ui/screens/detail/widgets/star_rating_widget.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class DetailBody extends StatefulWidget {
  final Book book;

  const DetailBody(this.book, {super.key});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final title = widget.book.title.replaceFirst(' ', '\n');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding * 2),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.23),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 33, color: whiteColor, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              StarRatingWidget(widget.book.starRating)
            ],
          ),
          const SizedBox(height: 20),
          SlideTransition(
            position: _slideAnimation,
            child: SizedBox(
              height: screenHeight * 0.125,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  widget.book.description,
                  style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
