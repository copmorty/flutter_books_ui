import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_books_ui/screens/home/home_app_bar.dart';
import 'package:flutter_books_ui/screens/home/home_body.dart';
import 'package:flutter_books_ui/screens/home/home_header.dart';
import 'package:flutter_books_ui/shared/helpers/custom_system_ui_overlay_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeAppBar(),
                HomeHeader(),
                HomeBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
