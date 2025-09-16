import 'package:flutter/material.dart';
import "package:matestrenght/Constant/Constants.dart";


class AuthButton extends StatefulWidget{

  final String label;
  final VoidCallback onTap;
  final IconData? icon_name;
  final bool? right_icon;
  
  const AuthButton({super.key,required this.label,this.icon_name,this.right_icon = false,required this.onTap});

  @override
  State<AuthButton> createState() => _AuthButton();
}


class _AuthButton extends State<AuthButton>{

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    
    
    

    

    //! ========================================================== Button Style ============================================= 
    LinearGradient gr = LinearGradient(colors:[MainColor.gold.color,MainColor.dark.color],stops:[0,0.90],begin:Alignment.topRight,end:Alignment.topLeft);
    BoxDecoration decoration = BoxDecoration(borderRadius: BorderRadius.circular(25),color:Colors.white,gradient:gr,border: BoxBorder.all(color: Colors.white,width:1));
    Container Button = Container(child: Center(child: Button_elemnts()),decoration: decoration,width: (screenWidth*0.8).toDouble(),height: 45);
    return InkWell(child: Button,onTap: widget.onTap,);
    
  }


  Row Button_elemnts(){
    TextStyle textshape = TextStyle(color:Colors.white,fontWeight: FontWeight.w700,fontSize: 16);
    Text label = Text(widget.label,textAlign: TextAlign.center,style: textshape);
    List<Widget> right_icon = [label,Icon(widget.icon_name,color: Colors.white,)];
    List<Widget> left_icon = [Icon(widget.icon_name,color: Colors.white,),label];

    if(widget.icon_name == null){
      return Row(children: [label],mainAxisAlignment: MainAxisAlignment.center,spacing: 5);
    }
    else if (widget.right_icon == true && widget.icon_name != null){
        return Row(children: right_icon,mainAxisAlignment: MainAxisAlignment.center,spacing: 5);

    }
    else{
      return Row(children: left_icon,mainAxisAlignment: MainAxisAlignment.center,spacing: 5);
    }

    
    

  }




}


class Inkbutton extends StatefulWidget{

  final String label;
  final VoidCallback onTap;
  const Inkbutton({super.key,required this.label,required this.onTap});

  @override
  State<Inkbutton> createState() => _Inkbutton();
}


class _Inkbutton extends State<Inkbutton>{

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textshape = TextStyle(color:Colors.black,fontWeight: FontWeight.w700,fontSize: 16);
    Text label = Text(widget.label,textAlign: TextAlign.center,style: textshape);

    //! ========================================================== Button Style ============================================= 
    ElevatedButton button = ElevatedButton(onPressed: widget.onTap, child: label,style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.black));
    return SizedBox(child:button ,width:screenWidth*0.8 ,height: 45,);
    
  }
}
