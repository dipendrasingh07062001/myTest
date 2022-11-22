import 'dart:async';

import 'package:flutter/material.dart';

class Track_Order extends StatefulWidget {
  const Track_Order({Key? key}) : super(key: key);

  @override
  _Track_OrderState createState() => _Track_OrderState();
}

class _Track_OrderState extends State<Track_Order> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(Duration(milliseconds: 500), () {
  setState(() {
    h=0.03;
    r=7;
  });
});
  
  }
  double h=0;
  double r=0;
  List<String> title = [
    "Order Placed",
    "Order Confirmed",
    "Order Processed",
    "Ready To Pickup"
  ];
  List<String> subtitle = [
    "We have received your order.",
    "Your order has been confirmed.",
    "We are preparing your order.",
    "Your order is ready to pickup"
  ];
  String? item = "";
  TextEditingController itemC = TextEditingController();
  List<String> imageList = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
    "assets/4.png",
  ];
  var status = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: 2)
                    ]),
                padding:
                    EdgeInsets.only(top: 8, left: 30, right: 30, bottom: 8),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "ESTIMATED TIME",
                          style: TextStyle(color: Colors.black38, fontSize: 16),
                        ),
                        Text("30 minutes"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "ORDER NUMBER",
                          style: TextStyle(color: Colors.black38, fontSize: 16),
                        ),
                        Text("#2482011"),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index == 0
                                    ? Container(
                                        width: 3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                                
                                      )
                                    : AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width: 3,
                                        color: (index <= status)
                                            ? Colors.green
                                            : Colors.grey,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                h),
                                CircleAvatar(
                                  backgroundColor: (status == index)
                                      ? Colors.blue
                                      : (index < status)
                                          ? Colors.green
                                          : Colors.grey,
                                  radius: r,
                                ),
                                index == (title.length - 1)
                                    ? Container(
                                        width: 3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      )
                                    : AnimatedContainer(
                                        curve: Curves.easeIn,
                                        duration: const Duration(seconds: 1),
                                        width: 3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                h,
                                        color: (index <= status - 1)
                                            ? Colors.green
                                            : Colors.grey),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceIn,
                            child: Image.asset(imageList[index]),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title[index],
                                style: TextStyle(
                                    fontSize: 18.5,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54),
                              ),
                              Text(
                                subtitle[index],
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}