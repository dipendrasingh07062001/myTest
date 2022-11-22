import 'dart:math';

import 'package:flutter/material.dart';

import 'User.dart';
import 'data_base_handler.dart';

class Sqlite extends StatefulWidget {
  const Sqlite({ Key? key }) : super(key: key);

  @override
  _SqliteState createState() => _SqliteState();
}

class _SqliteState extends State<Sqlite> {late DatabaseHandler handler;
TextEditingController _name= TextEditingController();
    TextEditingController _age= TextEditingController();
    TextEditingController _email= TextEditingController();
    TextEditingController _country= TextEditingController();
   

  int get _id => Random().nextInt(9999);
  late Future <List<User>> userlist;

  @override
  void initState(){
    super.initState();
    handler = DatabaseHandler();
     handler.initializeDB();
    userlist= handler.retrieveUsers();
    
     //print(handler.retrieveUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(actions: [
        RaisedButton(onPressed: (){
          setState(() {
             detail();
          });
        
    
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text("Add User",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
        
        )
      ],),
      body: Container(
        child:ListView.builder(
                itemCount: userlist.toString().length,
                itemBuilder: (BuildContext context, int index) {
                  return userlist.toString().isNotEmpty ? Card(
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(child: Text(userlist.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),))),
                        
                        // Expanded(
                        //   flex: 8,
                        //   child: Column(children: [
                        
                        //     Row(
                        //       children: [
                        //         const Text("Name:   ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        //         Text(snapshot.data![index].name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        //       ],
                        //     ),
                        //     Row(
                        //       children: [
                        //         const Text("age:   ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        //         Text(snapshot.data![index].age.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        //       ],
                        //     ),
                        //     Row(
                        //       children: [
                        //         const Text("Email:   ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        //         Text(snapshot.data![index].email.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        //       ],
                        //     ),
                        //     Row(
                        //       children: [
                        //         const Text("Country:   ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        //         Text(snapshot.data![index].country,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        //       ],
                        //     )
                        //   ],),
                        // ),
                      ],
                    )
                    //   child: ListTile(
                    // contentPadding: EdgeInsets.all(8.0),
                    // title: Text(snapshot.data![index].name),
                    // subtitle: Text(snapshot.data![index].age.toString()),

                  ):Center(child: CircularProgressIndicator());
                },
        )
        )
        );
     
               
         
          
  }
  void detail(){
    showDialog(context: context, builder: (context){
      return Card(
        child: Column(children: [
          TextFormField(
              controller: _name,
              decoration: InputDecoration(hintText: "Name"),
          ),
          TextFormField(
              controller: _age,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Age"),
          ),
          TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "Email"),
          ),
          TextFormField(
              controller: _country,
              decoration: InputDecoration(hintText: "Country"),
          ),
           FlatButton(onPressed: ()async{
             await addUsers();
            Navigator.pop(context);
             
          },
          child: Text("Add"),),
        ],),
      );
    });
    
  }
  Future<int?> addUsers() async {
    // User user = User(
    //   id: _id,
    //   email: _email.text,
    //   age: _age.text,
    //   country: _country.text, 
    //   name: _name.text
    //   );
    // List<User> listOfUsers = [user];
    // return await handler.insertUser(listOfUsers);
    return null;
  }

}