
// ignore_for_file: avoid_print


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project_2/1/constants.dart';
import 'package:firebase_project_2/1/new.dart';
import 'package:firebase_project_2/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '1/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   Prefernece.pref = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //var temp= Prefernece.pref!.getString("mail");
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
     // home: (temp!=null) ? Sheos(): MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController _name=TextEditingController();
TextEditingController _email=TextEditingController();
TextEditingController _address=TextEditingController();
TextEditingController _password=TextEditingController();

FirebaseAuth _auth= FirebaseAuth.instance;

FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("Sign In",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,)),
           SizedBox(height: MediaQuery.of(context).size.height*0.15,),
           TextFormField(
             controller: _name,
             decoration: InputDecoration(hintText: "Name",),
           ),
           TextFormField(
             controller: _email,
            decoration: InputDecoration(hintText: "Email",),
           ),
           TextFormField(
             controller: _address,
             
             decoration: InputDecoration(hintText: "Address",),
           ),
           TextFormField(
             obscureText: true,
             controller: _password,
             decoration: InputDecoration(hintText: "Password",),
           ),
           SizedBox(height: 20,),
           Container(
             width: MediaQuery.of(context).size.width*0.6,
             child: RaisedButton(onPressed: ()async{
             try {
                   var user=await _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
                  var userId = Random().nextInt(9999);

                  _auth.currentUser!.updateDisplayName(userId.toString());
                   _firestore.collection("User Data").doc('${userId}').set({
                    "Name":_name.text,
                    "Address":_address.text,
                    "Email":_email.text, 
                    "password":_password.text,                    
                   });
                    if(user!=null) {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    }
                  } catch (e) {
                    print(e);
                  }
                }, 
             
             color: Colors.blue,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30))),
             child: Text("Sign In",style: TextStyle(color: Colors.white)),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Or",style: TextStyle(fontSize: 15),),
               SizedBox(width: 10,),
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                 },
                 child: const Text("Login",style: TextStyle(color: Colors.blue,shadows: [Shadow(color: Colors.blue,blurRadius: 1.0)]),),
               )
             ],
           )
         ],

       ))
    );
  }
}
