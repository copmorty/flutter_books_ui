import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_books_ui/screens/detail/detail_app_bar.dart';
import 'package:flutter_books_ui/screens/detail/detail_body.dart';
import 'package:flutter_books_ui/screens/detail/detail_footer.dart';
import 'package:flutter_books_ui/shared/colors.dart';
import 'package:flutter_books_ui/shared/data/models/book.dart';
import 'package:flutter_books_ui/shared/helpers/custom_system_ui_overlay_style.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Book book = map['book'];
    final Key sourceWidgetKey = map['sourceWidgetKey'];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            _DetailScreenBackground(book: book, sourceWidgetKey: sourceWidgetKey),
            Material(
              color: transparentColor,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const DetailAppBar(),
                    DetailBody(book),
                    DetailFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailScreenBackground extends StatelessWidget {
  final Book book;
  final Key sourceWidgetKey;

  const _DetailScreenBackground({
    super.key,
    required this.book,
    required this.sourceWidgetKey,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'bookCover-${book.id}-$sourceWidgetKey',
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(blackColorOp015, BlendMode.darken),
        child: Image.asset(
          book.rawCoverImage,
          fit: BoxFit.cover,
          color: greyColor,
          colorBlendMode: BlendMode.saturation,
        ),
      ),
    );
  }
}
