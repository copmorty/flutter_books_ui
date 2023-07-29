import 'package:flutter/material.dart';
import 'package:flutter_books_ui/screens/detail/_detail_screen.dart';

class CustomDetailRoute extends PageRouteBuilder {
  @override
  final RouteSettings settings;

  CustomDetailRoute(this.settings)
      : super(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return DetailScreen(animation);
          },
        );
}
