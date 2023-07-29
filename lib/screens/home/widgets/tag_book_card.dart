import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/sizes.dart';

class TagBookCard extends StatefulWidget {
  final Book book;

  const TagBookCard(this.book, {super.key});

  @override
  State<TagBookCard> createState() => _TagBookCardState();
}

class _TagBookCardState extends State<TagBookCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastEaseInToSlowEaseOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onCardTap() async {
    _animationController.forward().whenComplete(() => _animationController.reverse());
    await Future.delayed(_animationController.duration! * 1.8);

    if (context.mounted) Navigator.of(context).pushNamed('/detail', arguments: {'book': widget.book, 'sourceWidgetKey': widget.key});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: _onCardTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
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
                tag: 'bookCover-${widget.book.id}-${widget.key}',
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(blackColorOp015, BlendMode.darken),
                  child: Image.asset(
                    widget.book.rawCoverImage,
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
                        widget.book.title.toUpperCase(),
                        style: const TextStyle(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 3),
                      const Divider(color: whiteColor, thickness: 1),
                      Text(
                        widget.book.subtitle,
                        style: const TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
