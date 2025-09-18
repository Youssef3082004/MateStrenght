import 'package:flutter/material.dart';
import 'package:matestrenght/Constant/Constants.dart';

class HRadioButton extends StatefulWidget{
  
  final List Radio_values; 
  const HRadioButton({super.key,required this.Radio_values});
  @override
  State<HRadioButton> createState() => _HRadioButton();

}




class _HRadioButton extends State<HRadioButton>{

  String? gender ;

  @override
  Widget build(BuildContext context) {
    Row Radio_Row = Row(mainAxisAlignment: MainAxisAlignment.center,children: [...Radio_row()],spacing: 35,);
    return RadioGroup<String>(groupValue: gender,onChanged: (value) => Choose_gender(value),child:Radio_Row );
  }




  void Choose_gender(value) => setState(() => gender = value);

  Iterable<Row> Radio_row(){
    return widget.Radio_values.map((value){

      Text Radio_label = Text(value,style: TextStyle(fontFamily: "Alex",fontWeight: FontWeight.w700),);
      Radio<String> Radio_b = Radio(value: value,activeColor:MainColor.gold.color,);

      return Row(children: [Radio_b,Radio_label],spacing: 0);


    });
  }

}









