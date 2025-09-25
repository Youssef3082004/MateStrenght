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





class StrengthMateTitle extends StatelessWidget {
  const StrengthMateTitle({super.key});

  @override
  Widget build(BuildContext context) {

    final Shader linearGradient = const LinearGradient(colors: <Color>[Color(0xFF1A1A1A), Color(0xFFB99A45)],tileMode: TileMode.mirror,begin: Alignment.centerLeft,end: Alignment.centerRight)
    .createShader(const Rect.fromLTWH(50.0, 20.0, 120.0, 20.0));

    Text Appbartitle = Text("Strength Mate",style: TextStyle(fontFamily: "pac",fontSize: 20,fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient));
    Text subtitle =  Text("Ready To Crush Your Goals ?",style: const TextStyle(fontFamily: "Alex",fontSize: 10,fontWeight: FontWeight.w600));
    return Column(children: [Appbartitle,subtitle],mainAxisAlignment: MainAxisAlignment.center,spacing: 5,);
  }
}
