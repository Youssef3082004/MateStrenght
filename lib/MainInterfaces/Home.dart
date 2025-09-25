import 'package:flutter/material.dart';
import 'package:matestrenght/Constant/Constants.dart';



class Home extends StatefulWidget{

  const Home({super.key});

  @override 
  State<Home> createState() => _Home();
}


class _Home extends State<Home>{


  @override
  Widget build(BuildContext context) {
    IconButton notification = IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 30));
    IconButton menu = IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 30));
    AppBar appBar = AppBar(leading: menu,centerTitle: true,title: StrengthMateTitle(),backgroundColor: Colors.white,actions: [notification],);    




    //! ============================================================= main App ================================================================
    SingleChildScrollView Controls =SingleChildScrollView(child:Column(children: [])); 
    Container main_app = Container(child: Controls,color: Colors.white,height: double.infinity,width: double.infinity,); 
    return Scaffold(body: main_app,appBar:appBar);
  }

}







