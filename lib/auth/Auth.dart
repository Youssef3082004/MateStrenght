import 'package:flutter/material.dart';
import "package:matestrenght/Constant/Constants.dart";
import 'package:matestrenght/Widgets/Button.dart';

class Auth extends StatefulWidget{
  const Auth({super.key});
  @override  
  State<Auth> createState() => _Auth();
}


class _Auth extends State<Auth>{

  @override
  Widget build(BuildContext context) {

    //! =============================================================== Image ====================================================
    Image Logo_image = Image.asset("images/icon_removebg.png",fit: BoxFit.contain,width: 200,height: 200,);
    
    //! =============================================================== Text ====================================================
    const TextStyle textshape = TextStyle(fontSize:30,fontFamily: "Inter",color: Colors.white,fontWeight: FontWeight.w800);
    Text Welcome_text = Text("\n\nWelcome",style: textshape,textAlign: TextAlign.center);
   
    //! =============================================================== Buttons ====================================================
    AuthButton sigin = AuthButton(label: "SIGN IN",  onTap: () => Navigator.pushNamedAndRemoveUntil(context,"/login", (route) => false));
    Inkbutton signup = Inkbutton(label: "SIGN UP",  onTap: (){});
    Column Button_Column = Column(children: [sigin,signup],mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,spacing: 20,);

    //! =============================================================== Text ====================================================
    const TextStyle textshape2 = TextStyle(fontSize:17,fontFamily: "Inter",color: Colors.white,fontWeight: FontWeight.w500);
    Padding option_text = Padding(padding: const EdgeInsets.all(10),child: Text("\n\nConitnue with",style: textshape2,textAlign: TextAlign.center));

    //! =============================================================== signin Options ====================================================

    Image Google = Image.asset("images/google.png",fit: BoxFit.contain,width: 50,height: 50,);
    Image facebook = Image.asset("images/facebook.png",fit: BoxFit.contain,width: 55,height: 55,);
    Image apple = Image.asset("images/apple.png",fit: BoxFit.contain,width: 50,height: 50,);

    Row signin_options = Row(children: [facebook,Google,apple],mainAxisAlignment: MainAxisAlignment.center,spacing: 20);

    //! =============================================================== Page Widgets ====================================================
    ListView controls = ListView(children: [Padding(padding: EdgeInsets.only(top:50),child: Logo_image),Welcome_text,Padding(padding: const EdgeInsets.all(50),child: Button_Column,),option_text,signin_options]);
    BoxDecoration decoration = BoxDecoration(gradient: LinearGradient(colors: [MainColor.dark.color,MainColor.gold.color],stops:[0.5,1],begin: Alignment.topCenter,end: Alignment.bottomCenter));
    Container main_app = Container(child: controls,decoration: decoration,alignment: Alignment.center);
    return Scaffold(body:  main_app);

  }
}