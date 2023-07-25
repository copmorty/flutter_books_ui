import 'package:flutter/material.dart';
import 'package:flutter_books_ui/screens/detail/_detail_screen.dart';
import 'package:flutter_books_ui/screens/home/_home_screen.dart';
import 'package:flutter_books_ui/shared/helpers/custom_theme.dart';

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
      routes: {
        '/':(context) => const HomeScreen(),
        '/detail':(context) => const DetailScreen(),
      },
    );
  }
}

