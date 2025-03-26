import 'package:flutter/material.dart';

class AnimatedPhysicalModelPractice extends StatefulWidget {
  const AnimatedPhysicalModelPractice({super.key});

  @override
  State<AnimatedPhysicalModelPractice> createState() =>
      _AnimatedPhysicalModelPracticeState();
}

class _AnimatedPhysicalModelPracticeState
    extends State<AnimatedPhysicalModelPractice> {
  Color color = Colors.red;
  Color shadow = Colors.black;
  BoxShape shape = BoxShape.circle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          shape = BoxShape.rectangle;
          color = Colors.blue;
          shadow = Colors.red;
          setState(() {});
        },
        child: AnimatedPhysicalModel(
          color: color,
          shadowColor: shadow,
          duration: Duration(seconds: 2),
          curve: Curves.elasticInOut,
          // shape: shape,
          child: Container(
            height: 300,
            alignment: Alignment.center,
            child: Text('Osama'),
          ),
        ),
      ),
    );
  }
}
