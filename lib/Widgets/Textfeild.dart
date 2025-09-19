import 'package:flutter/material.dart';
import 'package:matestrenght/Constant/Constants.dart';


class CustomTextFromFeild extends StatefulWidget{

  final String title;
  final String hint_text;
  final int Trailing_Width; 
  final bool password_or_no;
  final IconData prefiex_icon;
  final bool forgot_password;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool readonly;
  const CustomTextFromFeild({super.key,required this.title,required this.prefiex_icon,required this.hint_text,required this.password_or_no,this.forgot_password = true,required this.controller,this.Trailing_Width = 0,this.keyboardType = TextInputType.name,this.readonly = false});

  @override
  State<CustomTextFromFeild> createState() => _CustomTextFromFeild();
}


class _CustomTextFromFeild extends State<CustomTextFromFeild>{

  bool see = false;


  @override
  Widget build(BuildContext context) {

    double screen_width = MediaQuery.of(context).size.width;
    TextFormField textfeild =  TextFormField(enabled: !widget.readonly,readOnly: false,keyboardType:widget.keyboardType ,decoration: _textfeild_decor(hint_text:widget.hint_text,password:widget.password_or_no ),obscureText:widget.password_or_no == true ? !see :see  ,controller: widget.controller);
    SizedBox Textfeild_dim = SizedBox(child: textfeild,width: screen_width - widget.Trailing_Width);
    return Column(children: [Textfeild_dim],crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,);
  }

  InputDecoration _textfeild_decor({required String hint_text,required bool password}) {
      TextStyle Label_style = TextStyle(fontFamily: "andalus",fontSize: 22,fontWeight: FontWeight.bold,color: MainColor.gold.color);
      
      if (password == true){
         TextButton forget = TextButton(child: Text("Forget Password?",style: TextStyle(color: Colors.black87)),onPressed: (){});

        return InputDecoration(prefixIcon: Icon(widget.prefiex_icon),
        
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.black,width: 3)),
        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.black45,width: 2)),
        suffixIcon: IconButton(icon: Icon(see ? Icons.visibility : Icons.visibility_off),onPressed: () => setState(() {see = !see;}),)
        ,hint: Text(hint_text),counter:widget.forgot_password? forget:null,labelText: widget.title,labelStyle: Label_style );
      }

      else{
        return InputDecoration(prefixIcon: Icon(widget.prefiex_icon),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: MainColor.gold.color,width: 2)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.black,width: 3)),
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.black45,width: 2))
        ,hint: Text(hint_text),labelText: widget.title,labelStyle: Label_style);
      }

    } 
  



}