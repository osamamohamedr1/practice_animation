import 'package:flutter/material.dart';

class TweenAnimationPractice extends StatefulWidget {
  const TweenAnimationPractice({super.key});

  @override
  State<TweenAnimationPractice> createState() => _TweenAnimationPracticeState();
}

class _TweenAnimationPracticeState extends State<TweenAnimationPractice> {
  Color endColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 6 * 3.14), // Full Rotation
        duration: Duration(seconds: 4),
        // curve: Curves.bounceInOut,

        builder: (context, value, child) {
          return Transform.rotate(
            angle: value,
            child: Icon(Icons.home, size: value * 10, color: Colors.green),
          );
        },
      ),

      //  TweenAnimationBuilder(
      //   tween: ColorTween(begin: Colors.green, end: endColor),
      //   duration: Duration(seconds: 2),
      //   curve: Curves.bounceInOut,
      //   builder: (context, value, child) {
      //     return InkWell(
      //       onTap: () {
      //         endColor = Colors.red;
      //         setState(() {});
      //       },
      //       child: Container(
      //         color: value,
      //         width: 200,
      //         height: 200,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
