import 'package:flutter/material.dart';
import 'package:flutter_books_ui/screens/home/_home_screen.dart';
import 'package:flutter_books_ui/shared/helpers/custom_theme.dart';
import 'package:flutter_books_ui/shared/route_transitions/custom_detail_route.dart';
import 'package:flutter_books_ui/shared/route_transitions/scale_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books App',
      theme: CustomTheme.light,
      onGenerateRoute: (settings) {
        if (settings.name == '/') return ScaleRoute(const HomeScreen(), settings);
        if (settings.name == '/detail') return CustomDetailRoute(settings);

        return ScaleRoute(const HomeScreen(), settings);
      },
    );
  }
}
