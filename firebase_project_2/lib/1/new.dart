import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Sheos extends StatefulWidget {
  const Sheos({ Key? key }) : super(key: key);

  @override
  _SheosState createState() => _SheosState();
}

class _SheosState extends State<Sheos> {
   var auth = FirebaseAuth.instance;
  var shoes = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance.collection('User Data').snapshots();
 var data;  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
         // padding: EdgeInsets.only(top: 200),
          child: StreamBuilder<QuerySnapshot>(
            stream: collectionStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
      
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

          print( "data======   $data");
            return ListTile(
              leading: Container(child: Image.network(data['url']),),
               title: Text(data['type']),
               subtitle: Text(data['price']),
              //  trailing: Row(
              //    children: [
              //      Text("In stock"),
              //      Text( data['in stock'])
              //    ],
              //  ),
            );
          }).toList(),
        );
      },
          ), 
              )
           
        
        
      ),
    );
  }
}
