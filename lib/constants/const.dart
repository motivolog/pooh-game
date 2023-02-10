import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static TextStyle getButtonTextStyle() {
    return const TextStyle(
        fontFamily: 'Unbounded', fontSize: 22, color: Colors.white);
  }

  static Color getBackgroundColor() {
    return Color(0xFFFFE3D7);
  }

  static Color getButtonBackgroundColor() {
    return Colors.grey.shade900;
  }

  static Color getButtonTextColor() {
    return Colors.grey.shade900;
  }

  static TextStyle getArrowTextStyle() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle getWordTextStyle() {
    return TextStyle(color: Colors.black, fontSize: 45);
  }

  static BoxShadow getCardBoxShadow() {
    return BoxShadow(
      color: Color(0x0FFFF6F6F),
      offset: Offset(0, 0),
      blurRadius: 8,
    );
  }
}
