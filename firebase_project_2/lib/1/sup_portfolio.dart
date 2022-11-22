import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class Sub_port extends StatefulWidget {
  const Sub_port({ Key? key }) : super(key: key);

  @override
  _Sub_portState createState() => _Sub_portState();
}

class _Sub_portState extends State<Sub_port> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             body: Container(
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
               child: Column(
                 
                 children: [
                   SizedBox(height: 40,),
                   Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.black12),
                    child: Icon(Icons.arrow_back,)),
        
                    Text("Etherium",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.black12),
                    child: Icon(Icons.menu,)),
                ],),
              ),
              SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*0.17,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Color(0XAED5C6E3)),
                    child: Image.asset("assets/etherium.png")),
                    SizedBox(height: 20,),
                  Text("\$4,549.06",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("\$3,440.08",style: TextStyle(fontSize: 14,color: Colors.blue),),
                                SizedBox(width: 8,),
                                Text("+5,78%",style: TextStyle(fontSize: 14,color: Colors.blue),),
                              ],
                            ),
                            SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left:25,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Low",style: TextStyle(fontSize: 12,color: Colors.black45,fontWeight: FontWeight.bold),),
                          Text("\$3,323.07",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                        ],),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("High",style: TextStyle(fontSize: 12,color: Colors.black45,fontWeight: FontWeight.bold),),
                          Text("\$4,746.23",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                        ],),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Vol",style: TextStyle(fontSize: 12,color: Colors.black45,fontWeight: FontWeight.bold),),
                          Text("\$2,342.34",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Stack(children: [
                    Container(
                      
                      height: MediaQuery.of(context).size.height*0.45,
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        color: Colors.blue,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Row(children: [
                        Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                                          child: Center(child: Text("D",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),),
                                          SizedBox(width: 5,),
                        Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                                          child: Center(child: Text("W",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))),
                                          SizedBox(width: 5,),
                        Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                                          child: Center(child: Text("M",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))),
                                          SizedBox(width: 5,),
                        Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                                          child: Center(child: Text("Y",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))),
                        SizedBox(width: 130,),
                        Container(
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black12),
                                          child: Icon(Icons.zoom_in_outlined,color: Colors.white,)),                  
                      ],),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 25,
                      child: Row(
                        
                        children: [
                          Text("DES15",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                          SizedBox(width: 26,),
                          Text("DES16",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                          SizedBox(width: 26,),
                          Text("DES17",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                          SizedBox(width: 26,),
                          Text("DES18",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                          SizedBox(width: 26,),
                          Text("DES19",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                        ],
                      ))
                  ],),
                  SizedBox(height: 10,),
                  Container(
                     height: MediaQuery.of(context).size.height*0.08,
                      width: MediaQuery.of(context).size.width*0.88,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color(0Xff1E2E46),
                      onPressed: (){},
                      child: Text("Buy Etherium",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ],),
             ),
    );
  }
}