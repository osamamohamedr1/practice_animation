import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplicitAnimation1 extends StatefulWidget {
  const ExplicitAnimation1({super.key});

  @override
  State<ExplicitAnimation1> createState() => _ExplicitAnimation1State();
}

class _ExplicitAnimation1State extends State<ExplicitAnimation1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 100,
      upperBound: 400,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.forward();
      },
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              height: _controller.value,
              width: _controller.value,
              color: Colors.red,
              child: Text(
                'Osama Mohamed Rizk ',
                style: TextStyle(
                    fontSize: _controller.value / 10, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
