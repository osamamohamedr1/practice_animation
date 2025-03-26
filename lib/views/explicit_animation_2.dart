import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplicitAnimation2 extends StatefulWidget {
  const ExplicitAnimation2({super.key});

  @override
  State<ExplicitAnimation2> createState() => _ExplicitAnimation2State();
}

class _ExplicitAnimation2State extends State<ExplicitAnimation2>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      upperBound: 300,
      lowerBound: 100,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              width: animationController.value,
              height: animationController.value,
              color: Colors.blue,
              child: child,
            );
          },
          child: Center(
            child: Text(
              'Osama Mohamed',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Wrap(
          children: [
            MaterialButton(
              onPressed: () {
                animationController.forward();
              },
              child: Text('forward'),
            ),
            MaterialButton(
              onPressed: () {
                animationController.stop();
              },
              child: Text('stop'),
            ),
            MaterialButton(
              onPressed: () {
                animationController.reverse();
              },
              child: Text('reverse'),
            ),
            MaterialButton(
              onPressed: () {
                animationController.reset();
              },
              child: Text('reset'),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('forward'),
            ),
          ],
        )
      ],
    );
  }
}
