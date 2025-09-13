import 'package:flutter/material.dart';

enum MainColor {
  dark(Color(0xff1A1A1A)),
  gold(Color(0xffB99A45));

  final Color color;
  const MainColor(this.color);
}


enum TextShape {
  dark(TextStyle()),
  gold(TextStyle());

  final TextStyle style;
  const TextShape(this.style);
}
