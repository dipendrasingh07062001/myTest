import 'package:firebase_project_2/1/constants.dart';
import 'package:firebase_project_2/1/new.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../dashboard.dart';
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
TextEditingController _email=TextEditingController();
TextEditingController _password=TextEditingController();
var _auth=FirebaseAuth.instance;

String mail="";
String pass="";

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    var temp1 = Prefernece.pref!.getString("mail");
    var temp2 = Prefernece.pref!.getString("pass");
    if(temp1!=null) {
      _email.text = temp1;
    }
    if(temp2!=null){
      _password.text=temp2;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Login",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
          TextFormField(
            controller: _email,
           
             decoration: InputDecoration(hintText: "Email",),
           ),
           TextFormField(
             controller: _password,
             obscureText: true,
             decoration: InputDecoration(hintText: "Password",),
           ),
           SizedBox(height: 20,),
           Container(
             width: MediaQuery.of(context).size.width*0.6,
             child: RaisedButton(onPressed: ()async{

              await Prefernece.pref!.setString("mail", _email.text);
              await Prefernece.pref!.setString("pass", _password.text);
                  try {
                    var _user= await _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text);
                    
                    if (_user!=null) {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));

                    }
                  } catch (e) {
                  }
                }, 
             color: Colors.blue,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30))),
             child: Text("Login",style: TextStyle(color: Colors.white),),
             ),
           ),
        ],),
      ),
      
    );
  }
  
}