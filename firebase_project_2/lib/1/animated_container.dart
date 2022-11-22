import 'package:flutter/material.dart';

class ScreenTime extends StatefulWidget {
  const ScreenTime({Key? key}) : super(key: key);

 @override
_ScreenTimeState createState() => _ScreenTimeState();
}

class _ScreenTimeState extends State<ScreenTime> {
  List<Color> colorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow
 ];
List<Alignment> alignmentList = [
  Alignment.bottomLeft,
  Alignment.bottomRight,
  Alignment.topRight,
  Alignment.topLeft,
];
 int index = 0;
 Color bottomColor = Colors.black54;
 Color topColor = Colors.white10;
 Alignment begin = Alignment.bottomLeft;
 Alignment end = Alignment.topRight;


@override
Widget build(BuildContext context) {

return Scaffold(
    body: Stack(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 2),
          onEnd: () {
            setState(() {
              index = index + 1;
              // animate the color
              bottomColor = colorList[index % colorList.length];
              topColor = colorList[(index + 1) % colorList.length];

              //// animate the alignment
              // begin = alignmentList[index % alignmentList.length];
              // end = alignmentList[(index + 2) % alignmentList.length];
            });
          },
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, colors: [bottomColor, topColor])),
        ),
        Positioned.fill(
          child: IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                bottomColor = Colors.red;
              });
            },
          ),
        )
      ],
    ));
 }
}