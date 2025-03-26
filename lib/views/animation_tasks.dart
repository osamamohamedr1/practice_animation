import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationTasks extends StatefulWidget {
  const AnimationTasks({super.key});

  @override
  State<AnimationTasks> createState() => _AnimationTasksState();
}

class _AnimationTasksState extends State<AnimationTasks>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    scaleAnimation =
        Tween<double>(begin: 1, end: 5).animate(animationController);
    rotateAnimation =
        Tween<double>(begin: 0, end: 2).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: RotationTransition(
          turns: rotateAnimation,
          child: Icon(
            Icons.face,
            size: 30,
          ),
        ),
      ),
    );
  }
}
