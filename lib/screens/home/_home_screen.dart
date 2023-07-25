import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_books_ui/shared/helpers/custom_system_ui_overlay_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Text('Home'),
        ),
      ),
    );
  }
}
