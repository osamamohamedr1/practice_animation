import 'package:flutter/material.dart';

class AnimatedPositionedPractice extends StatefulWidget {
  const AnimatedPositionedPractice({super.key});

  @override
  State<AnimatedPositionedPractice> createState() => _AnimatedPositionedState();
}

class _AnimatedPositionedState extends State<AnimatedPositionedPractice> {
  double padding = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amber,
          height: 400,
        ),
        AnimatedPositionedDirectional(
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          start: padding,
          top: padding,
          child: InkWell(
            onTap: () {
              padding = 100;
              setState(() {});
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
