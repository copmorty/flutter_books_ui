import 'package:flutter_books_ui/shared/data/enums.dart';

class Book {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String author;
  final double starRating;
  final String coverImage;
  final String rawCoverImage;
  final List<Tag> tags;
  final int numLikes;

  const Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.author,
    required this.starRating,
    required this.coverImage,
    required this.rawCoverImage,
    required this.tags,
    required this.numLikes,
  });
}
