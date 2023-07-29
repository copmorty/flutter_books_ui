import 'package:flutter/material.dart';
import 'package:flutter_books_ui/shared/colors.dart';

class StarRatingWidget extends StatefulWidget {
  final double rating;

  const StarRatingWidget(this.rating, {super.key});

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late int fiveStarRating;

  @override
  void initState() {
    super.initState();
    fiveStarRating = (widget.rating / 2).truncate();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _animation = Tween<double>(begin: 0, end: fiveStarRating.toDouble()).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.rating.toString(),
          style: const TextStyle(fontSize: 25, color: whiteColor, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return _StarsWidget(_animation.value);
          },
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class _StarsWidget extends StatelessWidget {
  final double rating;
  static const int _totalStars = 5;

  const _StarsWidget(this.rating, {super.key});

  Color _getColor(int index) {
    if (index >= rating) return whiteColor;

    int integerPart = rating.toInt();
    double decimalPart = rating - integerPart;

    if (index < integerPart) return blackColor;

    int grayValue = 255 - (decimalPart * 255).toInt();

    return Color.fromARGB(255, grayValue, grayValue, grayValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_totalStars, (index) {
        return Icon(
          Icons.star,
          color: _getColor(index),
          size: 12,
        );
      }),
    );
  }
}
