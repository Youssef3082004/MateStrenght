import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'auth/Auth.dart';

void main() {
  runApp(const Myapp());
}


class Myapp extends StatefulWidget{

  const Myapp({super.key});
  @override  
  State<Myapp> createState() => _Myapp();

}


class _Myapp extends State<Myapp>{

  @override
  Widget build(BuildContext context) {

    Map<String,WidgetBuilder> routes = {
      "/auth":(context) => Auth(),
      "/login":(context) => Login(),
    };
   
    ThemeData Animiation = ThemeData(pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android:FadeForwardsPageTransitionsBuilder(backgroundColor: Colors.black)}));
   return MaterialApp(home: Login(),routes:routes,theme: Animiation,);
   
  
  }
}