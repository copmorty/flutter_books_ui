import 'package:flutter/widgets.dart';

class CustomIconFont {
  CustomIconFont._();

  static const _kFontFam = 'custom_icon_font';
  static const String? _kFontPkg = null;

  static const IconData fancyMenu = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData fancyBookmark = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cleanbookmark = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
