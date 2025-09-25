import 'package:flutter/material.dart';
import 'package:matestrenght/MainInterfaces/Home.dart';
import 'auth/Auth.dart';
import 'auth/login.dart';
import 'auth/Signup.dart';
import 'auth/Signup2.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jkinoyhvzzvtyjxdoqkt.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpraW5veWh2enp2dHlqeGRvcWt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg3MzI0MzQsImV4cCI6MjA3NDMwODQzNH0.D9f2ED_NDzAGQ-_52TN8qEBjLQf6d5p9WYSgXzPnD98",
  );

  runApp(Myapp());
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
      "/signup":(context) => Signup(),
      "/signup2":(context) => Signup2(),
    };
   
    ThemeData Animiation = ThemeData(pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android:FadeForwardsPageTransitionsBuilder(backgroundColor: Colors.black)}));
   return MaterialApp(home: Home(),routes:routes,theme: Animiation,);
   
  
  }
}