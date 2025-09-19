import "package:matestrenght/Widgets/Button.dart";
import "package:matestrenght/Widgets/Textfeild.dart";
import "package:flutter/material.dart";
import "package:matestrenght/Constant/Constants.dart";
import 'package:matestrenght/Widgets/Horizental_Radio.dart';


class Signup2 extends StatefulWidget{

  const Signup2({super.key});
  @override
  State<Signup2> createState() => _Signup2();

}



class _Signup2 extends State<Signup2>{

  final email_value =  TextEditingController();
  final password_value =  TextEditingController();
  final int textfeild_width = 230;
  final List<String> __Fitness_Goal = ["Build Muscle","Lose Body Fat","Boost Endurance","Increase Flexibility","Stay Healthy"] ;
  final  List<String> __Activities = ["Sedentary","Lightly Active","Moderately Active","Very Active","Highly Active"];
  final gold = MainColor.gold.color; 


  @override
  void dispose() {
    password_value.dispose();
    email_value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;

    //! =========================================================== First Container ==================================================
    TextStyle textStyle = TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "Alex");
    Text LoginText = Text("    You're almost done!  \n    Setup complete after this\n\n",style: textStyle); 

    //! =========================================================== Second Container  ==================================================
    Row createaccount = Row(children: [Text("Create Account\n\n",style: const TextStyle(fontFamily:"Inter",fontSize: 24,fontWeight: FontWeight.w800))],mainAxisAlignment: MainAxisAlignment.center,);
    
    CustomTextFromFeild Birthday = CustomTextFromFeild(hint_text: "dd-mm-yyyy",password_or_no: false,title: "Birthday",controller:email_value,Trailing_Width:textfeild_width ,prefiex_icon: Icons.cake);
    CustomTextFromFeild Age = CustomTextFromFeild(hint_text: "",password_or_no: false,title: "Age",controller:email_value,Trailing_Width:textfeild_width ,prefiex_icon: Icons.calendar_month,);
    Row Age_row = Row(children: [Birthday,Age],mainAxisAlignment: MainAxisAlignment.center,spacing: 7);

    CustomTextFromFeild wight = CustomTextFromFeild(hint_text: "in (kg)",password_or_no: false,title: "Weight",controller:email_value,Trailing_Width:textfeild_width ,prefiex_icon: Icons.monitor_weight_rounded,);
    CustomTextFromFeild height = CustomTextFromFeild(hint_text: "in (cm)",password_or_no: false,title: "Height",controller:email_value,Trailing_Width:textfeild_width ,prefiex_icon: Icons.flag,);
    Row weight_row = Row(children: [wight,height],mainAxisAlignment: MainAxisAlignment.center,spacing: 7);



    MenuStyle menu_style = MenuStyle(backgroundColor: WidgetStateProperty.all(gold),side:WidgetStateProperty.all(BorderSide(width: 0)));
    DropdownMenu Goal = DropdownMenu(dropdownMenuEntries: dropdownValues(values: __Fitness_Goal,leading_icon: Icons.fitness_center),leadingIcon: Icon(Icons.fitness_center),width: 180,label: Text("Goal",style: TextStyle(color: gold,fontFamily: "andalus",fontSize: 22,fontWeight: FontWeight.w800),),menuStyle: menu_style);
    DropdownMenu Activity = DropdownMenu(dropdownMenuEntries: dropdownValues(values: __Activities,leading_icon:Icons.sports_gymnastics_rounded ),leadingIcon: Icon(Icons.sports_gymnastics_rounded,),width: 180,label: Text("Actvity",style: TextStyle(color: gold,fontFamily: "andalus",fontSize: 13,fontWeight: FontWeight.w800),),menuStyle: menu_style,);
    Row Goal_row = Row(children: [Goal,Activity],mainAxisAlignment: MainAxisAlignment.center,spacing: 10);


    Text Gender = Text("Gender :",style: TextStyle(fontFamily: "Andalus",color: gold,fontSize: 25,fontWeight: FontWeight.w800),);
    HRadioButton h = HRadioButton(Radio_values: ["Male","Female"]);
    Row Gender_row = Row(children: [Gender,h],mainAxisAlignment: MainAxisAlignment.spaceEvenly);

    Column Inputs = Column(children: [Age_row,weight_row,Goal_row,Gender_row],spacing: 10,mainAxisAlignment: MainAxisAlignment.center);

    //! =========================================================== Signin Button  ==================================================

    AuthButton Next_button = AuthButton(label: "Back", onTap: ()=>Navigator.pop(context, (route) => false) ,icon_name: Icons.arrow_back,right_icon: false);
    AuthButton Signup_button = AuthButton(label: "Signup", onTap: ()=> print("gggg"),icon_name: Icons.how_to_reg_rounded,right_icon: false);



    //! =========================================================== Sign Up  ==================================================
    Text signin_text = Text("Have an Account?",style: TextStyle(fontFamily: "Alex",fontWeight: FontWeight.w700,fontSize: 20));
    TextButton signin_button = TextButton(onPressed: ()=> Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false), child:Text("SIGN IN",style: TextStyle(color: gold,fontWeight: FontWeight.w700,fontSize: 20),));
    Row signin_row = Row(children: [signin_text,signin_button],mainAxisAlignment: MainAxisAlignment.center); 

    ListView second_controls = ListView(children: [createaccount,Inputs,SizedBox(height: 60),Row(children: [Next_button],mainAxisAlignment: MainAxisAlignment.center),SizedBox(height: 10,),Row(children: [Signup_button],mainAxisAlignment: MainAxisAlignment.center),SizedBox(height: 90),signin_row],physics: NeverScrollableScrollPhysics());
    BoxDecoration SecondContainer_decor = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),color: Colors.white);
    Container SecondContainer = Container(child: second_controls,decoration: SecondContainer_decor,height:Height - 186,padding: EdgeInsets.all(0));

    //! =========================================================== main Page Controls ==================================================

    SingleChildScrollView Controls = SingleChildScrollView(child: Column(children: [Padding(padding: const EdgeInsets.only(top: 50),child: LoginText),SecondContainer])); 
    BoxDecoration decoration = BoxDecoration(gradient: LinearGradient(colors: [MainColor.dark.color,MainColor.gold.color],stops:[0,0.9],begin: Alignment.centerLeft,end: Alignment.centerRight));
    Container main_app = Container(child: Controls,decoration: decoration,padding: EdgeInsets.all(0));
    return Scaffold(body: main_app);
  }



List<DropdownMenuEntry<String>> dropdownValues({required List<String> values,required IconData leading_icon}) {
  return values.map((value) {
    return DropdownMenuEntry<String>(
      value: value,
      label: value,
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white) ),
      leadingIcon: Icon(leading_icon,color: gold,),
      labelWidget:  Text(value,style: TextStyle(color: Colors.black))
      
      );
  }).toList();
}





} 
  





