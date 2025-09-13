import 'package:flutter/material.dart';
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
   
   return MaterialApp(home: Auth());
   
  
  }
}