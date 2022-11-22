// ignore_for_file: camel_case_types

//import 'package:firebase_project_2/sign_up.dart';
import 'package:firebase_project_2/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../dashboard.dart';

class Profile_Update extends StatefulWidget {
  const Profile_Update({ Key? key }) : super(key: key);

  @override
  _Profile_UpdateState createState() => _Profile_UpdateState();
}

class _Profile_UpdateState extends State<Profile_Update> {


  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getData();
  }
  var user_id;

  getData ( ) async {
  var data;
   user_id= auth.currentUser!.displayName;
   await user.collection("User Data").doc(user_id).get().then((value) {  data= value; } );
  _name.text = data['Name'];
  _email.text=data['Email'];
  _address.text=data['Address'];
  _password.text=data['password'];
  setState(() {
  });
  }
  var auth = FirebaseAuth.instance;
  var user = FirebaseFirestore.instance;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(

          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 8)],borderRadius: BorderRadius.only(topRight: Radius.elliptical(70,100),bottomLeft: Radius.elliptical(70, 100),), color: Colors.white,),
          
          height: MediaQuery.of(context).size.height*0.7,
          width: MediaQuery.of(context).size.width*0.8,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text("Profile Update",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.blue,shadows: [Shadow(blurRadius: 5, color: Colors.blue)]),),
            SizedBox(height: 60,),
            Container(

          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 3)],borderRadius: BorderRadius.only(topRight: Radius.elliptical(15,22),bottomLeft: Radius.elliptical(15, 22),), color: Colors.white,),
          padding: EdgeInsets.only(left: 10,top: 7),
          height: MediaQuery.of(context).size.height*0.05,
          width: MediaQuery.of(context).size.width*0.7,
          child: TextFormField(
            controller: _name,
          
            decoration: InputDecoration(hintText: _name.text,border: InputBorder.none),style: const TextStyle(fontSize: 15),),
        ),
        SizedBox(height: 20,),
          Container(

          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 3)],borderRadius: BorderRadius.only(topRight: Radius.elliptical(15,22),bottomLeft: Radius.elliptical(15, 22),), color: Colors.white,),
          padding: EdgeInsets.only(left: 10,top: 7),
          height: MediaQuery.of(context).size.height*0.05,
          width: MediaQuery.of(context).size.width*0.7,
          child:  TextFormField(
            controller: _email,
            decoration: InputDecoration(hintText: _email.text,border: InputBorder.none),style: TextStyle(fontSize: 15),),
        ),
        SizedBox(height: 20,),
          Container(

          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 3)],borderRadius: BorderRadius.only(topRight: Radius.elliptical(15,22),bottomLeft: Radius.elliptical(15, 22),), color: Colors.white,),
          padding: EdgeInsets.only(left: 10,top: 7),
          height: MediaQuery.of(context).size.height*0.05,
          width: MediaQuery.of(context).size.width*0.7,
          child:  TextFormField(
            controller: _address,
            decoration: InputDecoration(hintText: _address.text,border: InputBorder.none),style: TextStyle(fontSize: 15),),
        ),
        SizedBox(height: 20,),
        Container(

          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 3)],borderRadius: BorderRadius.only(topRight: Radius.elliptical(15,22),bottomLeft: Radius.elliptical(15, 22),), color: Colors.white,),
          padding: EdgeInsets.only(left: 10,top: 7),
          height: MediaQuery.of(context).size.height*0.05,
          width: MediaQuery.of(context).size.width*0.7,
          child:  TextFormField(
            controller: _password,
            decoration: InputDecoration(hintText: _password.text,border: InputBorder.none),style: TextStyle(fontSize: 15),),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()async{
             try {
                       await user.collection("User Data").doc('$user_id').update({
                        "Name":_name.text,
                        "Address":_address.text,
                        "Email":_email.text, 
                        "password":_password.text,                    
                       });
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                      });
                      
                    }, 
              child: Text("Update Profile",style: TextStyle(fontSize: 17,color: Colors.blue,shadows: [Shadow(blurRadius: 2,color: Colors.blue)],))
              ),
              SizedBox(width: 3,),
              Text("Or"),
              SizedBox(width: 3,),
              InkWell(
                onTap: ()async{
                  try {
                    await auth.currentUser!.delete();
                    await user.collection("User Data").doc('$user_id').delete();
                  } catch (e) {
                  }
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  });
                },
                child: Text("Delete Account",style: TextStyle(fontSize: 17, color: Colors.blue, shadows: [Shadow(blurRadius: 2,color: Colors.blue)],),),
              )
          ],
        ),
        SizedBox(height: 50,)
            ],
          ),
        ),
      ),
      
    );
  }
}