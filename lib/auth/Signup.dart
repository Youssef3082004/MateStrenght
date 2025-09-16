import "package:matestrenght/Widgets/Button.dart";
import "package:matestrenght/Widgets/Textfeild.dart";
import "package:flutter/material.dart";
import "package:matestrenght/Constant/Constants.dart";



class Signup extends StatefulWidget{

  const Signup({super.key});
  @override
  State<Signup> createState() => _Signup();

}



class _Signup extends State<Signup>{

  bool Remember = false;
  final email_value =  TextEditingController();
  final password_value =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;

    //! =========================================================== First Container ==================================================
    TextStyle textStyle = TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "Alex");
    Text LoginText = Text("    Let’s stay in touch \n    type your contact info here\n\n",style: textStyle); 

    //! =========================================================== Second Container  ==================================================

    Row createaccount = Row(children: [Text("Create Account\n",style: const TextStyle(fontFamily:"Inter",fontSize: 24,fontWeight: FontWeight.w800))],mainAxisAlignment: MainAxisAlignment.center,);
    
    CustomTextFromFeild Fullname = CustomTextFromFeild(hint_text: "Write Your Fullname",password_or_no: false,title: "Fullname",controller:email_value,Trailing_Width:30 ,prefiex_icon: Icons.person);
    CustomTextFromFeild Email = CustomTextFromFeild(hint_text: "Write Your Email",password_or_no: false,title: "Email",controller:email_value,Trailing_Width:30 ,prefiex_icon: Icons.email,);
    
    CustomTextFromFeild phonenumber = CustomTextFromFeild(hint_text: "Write Your PhoneNumber",password_or_no: false,title: "PhoneNumber",controller:email_value,Trailing_Width:180 ,prefiex_icon: Icons.phone,);
    DropdownMenu contries = DropdownMenu(dropdownMenuEntries: [DropdownMenuEntry(value: "hala", label: "hala")],);
    Row Phone_row = Row(children: [contries,phonenumber],mainAxisAlignment: MainAxisAlignment.center,spacing: 10,);

    CustomTextFromFeild country = CustomTextFromFeild(hint_text: "Write Your Country",password_or_no: false,title: "Country",controller:email_value,Trailing_Width:30 ,prefiex_icon: Icons.flag,);
    CustomTextFromFeild password = CustomTextFromFeild(hint_text: "Write Your Password",password_or_no: true,forgot_password: false,title: "Password",controller:email_value,Trailing_Width:30 ,prefiex_icon: Icons.lock,);
    CustomTextFromFeild confirm_password = CustomTextFromFeild(hint_text: "",password_or_no: true,forgot_password: false,title: "Confirm Password",controller: password_value,Trailing_Width:30 ,prefiex_icon: Icons.lock,);
    
    
    Text Chechbox_text = Text("Remeber Me",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),);
    Checkbox Remember_me = Checkbox(value: Remember, onChanged: (value) => setState(() {Remember = value!;}));
    Row Remember_me_row = Row(children: [Remember_me,Chechbox_text],mainAxisAlignment: MainAxisAlignment.center);

    Column Inputs = Column(children: [Fullname,Email,Phone_row,country,password,confirm_password,Remember_me_row],spacing: 10,mainAxisAlignment: MainAxisAlignment.center);

    //! =========================================================== Signin Button  ==================================================

    AuthButton Next_button = AuthButton(label: "Next", onTap: ()=> print("gggg"),icon_name: Icons.arrow_forward,right_icon: true);


    //! =========================================================== Sign Up  ==================================================
    Text signin_text = Text("Have an Account?",style: TextStyle(fontFamily: "Alex",fontWeight: FontWeight.w700,fontSize: 20));
    TextButton signin_button = TextButton(onPressed: ()=> Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false), child:Text("SIGN IN",style: TextStyle(color: MainColor.gold.color,fontWeight: FontWeight.w700,fontSize: 20),));
    Row signin_row = Row(children: [signin_text,signin_button],mainAxisAlignment: MainAxisAlignment.center); 

    ListView second_controls = ListView(children: [createaccount,Inputs,SizedBox(height: 50,),Row(children: [Next_button],mainAxisAlignment: MainAxisAlignment.center),SizedBox(height: 35),signin_row],physics: NeverScrollableScrollPhysics());
    BoxDecoration SecondContainer_decor = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),color: Colors.white);
    Container SecondContainer = Container(child: second_controls,decoration: SecondContainer_decor,height:Height-120,padding: EdgeInsets.all(0));

    //! =========================================================== main Page Controls ==================================================

    SingleChildScrollView Controls =SingleChildScrollView(child:Column(children: [Padding(padding: const EdgeInsets.only(top: 80),child: LoginText),SecondContainer])); 
    BoxDecoration decoration = BoxDecoration(gradient: LinearGradient(colors: [MainColor.dark.color,MainColor.gold.color],stops:[0,0.9],begin: Alignment.centerLeft,end: Alignment.centerRight));
    Container main_app = Container(child: Controls,decoration: decoration,padding: EdgeInsets.all(0));
    return Scaffold(body: main_app);
  }
} 
  






// Text Chechbox_text = Text("Remeber Me",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),);
// Checkbox Remember_me = Checkbox(value: Remember, onChanged: (value) => setState(() {Remember = value!;}));
// Row Remember_me_row = Row(children: [Remember_me,Chechbox_text],mainAxisAlignment: MainAxisAlignment.center);