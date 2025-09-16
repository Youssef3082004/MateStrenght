import "package:matestrenght/Widgets/Button.dart";
import "package:matestrenght/Widgets/Textfeild.dart";
import "package:flutter/material.dart";
import "package:matestrenght/Constant/Constants.dart";



class Login extends StatefulWidget{

  const Login({super.key});
  @override
  State<Login> createState() => _Login();

}



class _Login extends State<Login>{

  bool Remember = false;
  final email_value =  TextEditingController();
  final password_value =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;

    //! =========================================================== First Container ==================================================
    TextStyle textStyle = TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "Alex");
    Text LoginText = Text("    Welcome back! \n    Sign in to get started\n\n",style: textStyle); 

    //! =========================================================== Second Container  ==================================================

    Row signin = Row(children: [Text("\nSIGN-IN\n\n",style: const TextStyle(fontFamily:"Inter",fontSize: 24,fontWeight: FontWeight.w800))],mainAxisAlignment: MainAxisAlignment.center,);

    CustomTextFromFeild Email = CustomTextFromFeild(hint_text: "Write Your Email",password_or_no: false,title: "E-mail",controller:email_value,Trailing_Width:30 ,prefiex_icon: Icons.email,);
    CustomTextFromFeild password = CustomTextFromFeild(hint_text: "Enter Your Password",password_or_no: true,title: "Password",controller: password_value,Trailing_Width:30 ,prefiex_icon: Icons.lock,);
    
    Column Inputs = Column(children: [Email,password],spacing: 35,mainAxisAlignment: MainAxisAlignment.center);

    //! =========================================================== Signin Button  ==================================================

    AuthButton sigin_button = AuthButton(label: "SIGN IN", onTap: ()=> print("gggg"),icon_name: Icons.login);


    //! =========================================================== Sign Up  ==================================================
    Text signup_text = Text("Don't Have an Account?",style: TextStyle(fontFamily: "Alex",fontWeight: FontWeight.w700,fontSize: 20));
    TextButton signup_button = TextButton(onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, "/signup", (route) => false), child:Text("SIGN UP",style: TextStyle(color: MainColor.gold.color,fontWeight: FontWeight.w700,fontSize: 20),));
    Row signup_row = Row(children: [signup_text,signup_button],mainAxisAlignment: MainAxisAlignment.center); 

    ListView second_controls = ListView(children: [signin,Inputs,SizedBox(height: 50,),Row(children: [sigin_button],mainAxisAlignment: MainAxisAlignment.center),SizedBox(height: 180,),signup_row],physics: NeverScrollableScrollPhysics());
    BoxDecoration SecondContainer_decor = BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white);
    Container SecondContainer = Container(child: second_controls,decoration: SecondContainer_decor,height:Height);

    //! =========================================================== main Page Controls ==================================================

    ListView Controls = ListView(children: [Padding(padding: const EdgeInsets.all(20),child: LoginText),Center(child: SecondContainer)],physics: NeverScrollableScrollPhysics());
    BoxDecoration decoration = BoxDecoration(gradient: LinearGradient(colors: [MainColor.dark.color,MainColor.gold.color],stops:[0,0.9],begin: Alignment.centerLeft,end: Alignment.centerRight));
    Container main_app = Container(child: Controls,decoration: decoration);
    return Scaffold(body: main_app);
  }
} 







// Text Chechbox_text = Text("Remeber Me",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),);
// Checkbox Remember_me = Checkbox(value: Remember, onChanged: (value) => setState(() {Remember = value!;}));
// Row Remember_me_row = Row(children: [Remember_me,Chechbox_text],mainAxisAlignment: MainAxisAlignment.center);