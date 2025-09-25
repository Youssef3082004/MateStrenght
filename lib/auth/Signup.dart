import "package:matestrenght/Widgets/Button.dart";
import "package:matestrenght/Widgets/Textfeild.dart";
import "package:flutter/material.dart";
import "package:matestrenght/Constant/Constants.dart";
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import "package:supabase_flutter/supabase_flutter.dart";


class Signup extends StatefulWidget{

  const Signup({super.key});
  @override
  State<Signup> createState() => _Signup();

}



class _Signup extends State<Signup>{

  final email_value =  TextEditingController();
  final fullname_value =  TextEditingController();
  final prefixnumber_value =  TextEditingController();
  final country_value =  TextEditingController();
  final phone_value =  TextEditingController();
  final password_value =  TextEditingController();
  final password_confirm_value =  TextEditingController();
  bool Remember = false;  
  Map<String, dynamic> numbers = {};

  @override
  void initState() {
    loadJson();
    super.initState();

  }

  @override
  void dispose() {
    email_value.dispose();
    fullname_value.dispose();
    prefixnumber_value.dispose();
    country_value.dispose();
    phone_value.dispose();
    password_confirm_value.dispose();
    password_value.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    double Height = MediaQuery.of(context).size.height;

    //! =========================================================== First Container ==================================================
    TextStyle textStyle = TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "Alex");
    Text LoginText = Text("    Let’s stay in touch \n    type your contact info here\n\n",style: textStyle); 

    //! =========================================================== Second Container  ==================================================

    Row createaccount = Row(children: [Text("Create Account\n",style: const TextStyle(fontFamily:"Inter",fontSize: 24,fontWeight: FontWeight.w800))],mainAxisAlignment: MainAxisAlignment.center,);
    
    CustomTextFromFeild Fullname = CustomTextFromFeild(hint_text: "Write Your Fullname",password_or_no: false,title: "Fullname",controller:fullname_value,Trailing_Width:30 ,prefiex_icon: Icons.person);
    CustomTextFromFeild Email = CustomTextFromFeild(hint_text: "Write Your Email",password_or_no: false,title: "Email",controller:email_value,Trailing_Width:30 ,prefiex_icon: Icons.email,keyboardType: TextInputType.emailAddress,);
    
    MenuStyle menu_style = MenuStyle(backgroundColor: WidgetStateProperty.all(MainColor.gold.color),side:WidgetStateProperty.all(BorderSide(width: 0)));
    CustomTextFromFeild phonenumber = CustomTextFromFeild(hint_text: "Without code",password_or_no: false,title: "PhoneNumber",controller:phone_value,Trailing_Width:220 ,prefiex_icon: Icons.phone,keyboardType: TextInputType.number,);
    DropdownMenu contries = DropdownMenu(menuStyle: menu_style,label:Text("Code",style: TextStyle(fontFamily: "andalus",fontSize: 20,fontWeight: FontWeight.bold,color: MainColor.gold.color)) ,dropdownMenuEntries: [...dropdownValues(values: numbers)],width: 180,menuHeight:350,textAlign: TextAlign.left,leadingIcon:Icon(Icons.public) ,controller: prefixnumber_value,onSelected: (value) => on_select_dropdown(value));
    Row Phone_row = Row(children: [contries,phonenumber],mainAxisAlignment: MainAxisAlignment.center,spacing: 5);

    CustomTextFromFeild country = CustomTextFromFeild(hint_text: "Write Your Country",password_or_no: false,title: "Country",controller:country_value,Trailing_Width:30 ,prefiex_icon: Icons.flag,readonly: true,);
    CustomTextFromFeild password = CustomTextFromFeild(hint_text: "Write Your Password",password_or_no: true,forgot_password: false,title: "Password",controller:password_value,Trailing_Width:30 ,prefiex_icon: Icons.lock);
    CustomTextFromFeild confirm_password = CustomTextFromFeild(hint_text: "",password_or_no: true,forgot_password: false,title: "Confirm Password",controller: password_confirm_value,Trailing_Width:30 ,prefiex_icon: Icons.lock,);
    
    
    Text Chechbox_text = Text("Remeber Me",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),);
    Checkbox Remember_me = Checkbox(value: Remember, onChanged: (value) => setState(() {Remember = value!;}));
    Row Remember_me_row = Row(children: [Remember_me,Chechbox_text],mainAxisAlignment: MainAxisAlignment.center);

    Column Inputs = Column(children: [Fullname,Email,Phone_row,country,password,confirm_password,Remember_me_row],spacing: 10,mainAxisAlignment: MainAxisAlignment.center);

    //! =========================================================== Signin Button  ==================================================

    AuthButton Next_button = AuthButton(label: "Next", onTap: ()=>Navigator.pushNamed(context, "/signup2") ,icon_name: Icons.arrow_forward,right_icon: true);
    // AuthButton Next_button = AuthButton(label: "Next", onTap: ()=> insert_users(),icon_name: Icons.arrow_forward,right_icon: true);


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


List<DropdownMenuEntry<String>> dropdownValues({required Map<String, dynamic> values}) {

  return values.entries.map((entry){
    final value = entry.value as List;
    final String key = entry.key;
    return DropdownMenuEntry<String>(
      value: value[0],
      label: key,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),),
      leadingIcon: Text("${value[1]}"),
      labelWidget: Text("${value[0]}",style: const TextStyle(color: Colors.black)),
    );
  }).toList();
}


void on_select_dropdown(value) => setState(() {
  country_value.text = value;
});

  
Future<Map<String, dynamic>> readJson() async {
  final String response = await rootBundle.loadString('data/country.json');
  final data = json.decode(response) as Map<String, dynamic>;
  return data;
}


 Future<void> loadJson() async {
    numbers = await readJson();
    setState(() {}); 
  }


// void insert_users() async{
  

// await Supabase.instance.client.from("user").insert({"Email":email_value.text,"Password":password_value.text});


// }























} 
  







