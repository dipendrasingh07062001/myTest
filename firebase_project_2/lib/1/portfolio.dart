import 'package:firebase_project_2/1/sup_portfolio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({ Key? key }) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children:[ 
            Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.3,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),gradient: LinearGradient(begin: Alignment.centerLeft,end: Alignment.centerRight,colors: [Color(0Xff74C4D9),Color(0Xff89A3D8)])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.white12),
                    child: const Icon(Icons.arrow_back,color: Colors.white,)),
        
                    const Text("Holding Portofolio",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                    Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.white12),
                    child: const Icon(Icons.notification_add,color: Colors.white,)),
                ],),
              ),
              
              const SizedBox(height: 10,),
              const Text("\$11,784.43",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                Icon(Icons.arrow_upward_sharp,color: Colors.white,size: 20,),
                Text("\$5,503.34",style: TextStyle(fontSize: 14,color: Colors.white),)
              ],)
              
            ],),),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                Text("Recommend To Buy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                Text("View All",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18,),),
              ],),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context,index){
                return 
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: InkWell(
                   onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Sub_port()));
                        },
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.1,
                            decoration: BoxDecoration(color: const Color(0XAED5C6E3),borderRadius: BorderRadius.circular(18)),
                            child: Image.asset("assets/etherium.png")),
                            const SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                            Text("Etherium",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 8,),
                            Text("0.80 ETH",style: TextStyle(fontSize: 12,color: Colors.black45),),
                          ],),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            const Text("\$4,549.06",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            const SizedBox(height: 8,),
                            Row(
                              children: const [
                                Text("\$3,440.08",style: TextStyle(fontSize: 12,color: Colors.blue),),
                                SizedBox(width: 8,),
                                Text("+5,78%",style: TextStyle(fontSize: 12,color: Colors.blue),),
                              ],
                            ),
                            ],)
                        ],
                      ),
                    ),
                  ),
                ),
              );
              },
             ),
            ),
          ],),
         
          Container(

            child: Column(
              children: [
                SizedBox(height: 180,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return  SizedBox(
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.40,
                          
                          child: Card(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                             color: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.all(20.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 Container(
                                   height: MediaQuery.of(context).size.height*0.06,
                                   width: MediaQuery.of(context).size.width*0.1,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.black12),
                                   child: Image.asset("assets/bitcoin.png"),
                                 ),
                                 const Text("Bitcoin",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: const [
                                   Icon(Icons.arrow_upward_sharp,size: 20,color: Colors.blue,),
                                   Text("\$3.4",style: TextStyle(color: Colors.blue),),
                                   Text("+5.78",style: TextStyle(color: Colors.blue),)
                                 ],)
                               ],),
                             ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          ]),
      ),
    );
  }
}