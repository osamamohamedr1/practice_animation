import 'package:flutter/material.dart';

class AnimatedPaddingPractice extends StatefulWidget {
  const AnimatedPaddingPractice({super.key});

  @override
  State<AnimatedPaddingPractice> createState() =>
      _AnimatedPaddingPracticeState();
}

class _AnimatedPaddingPracticeState extends State<AnimatedPaddingPractice> {
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: AnimatedPadding(
        duration: Duration(seconds: 2),
        padding: EdgeInsets.all(padding),
        curve: Curves.bounceOut,
        child: InkWell(
          onTap: () {
            padding = 50;
            setState(() {});
          },
          child: Container(
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
