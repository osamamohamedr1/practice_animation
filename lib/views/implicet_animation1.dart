import 'package:flutter/material.dart';

class ImplicetAnimation1 extends StatefulWidget {
  const ImplicetAnimation1({super.key});

  @override
  State<ImplicetAnimation1> createState() => _ImplicetAnimation1State();
}

class _ImplicetAnimation1State extends State<ImplicetAnimation1> {
  double height = 100;
  double width = 100;
  Color color = Colors.amber;
  double opacity = 1;
  double fontSize = 14;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              height = 200;
              width = 200;
              color = Colors.red;
              opacity = 0;
              setState(() {});
            },
            child: AnimatedContainer(
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 2),
              width: width,
              height: height,
              color: color,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //opacity
        InkWell(
          onTap: () {
            opacity = 0;
            setState(() {});
          },
          child: AnimatedOpacity(
            curve: Curves.bounceInOut,
            opacity: opacity,
            duration: Duration(seconds: 2),
            child: Container(
              color: Colors.black,
              height: 100,
              width: 200,
            ),
          ),
        ),
        InkWell(
            onTap: () {
              fontSize = 20;
              setState(() {});
            },
            child: AnimatedDefaultTextStyle(
              curve: Curves.bounceOut,
              style: TextStyle(fontSize: fontSize, color: Colors.black),
              duration: Duration(seconds: 2),
              child: Text('i practice flutter animation'),
            )),
      ],
    );
  }
}
