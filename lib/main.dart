import 'package:flutter/material.dart';

import 'package:practice_animation/views/login_animation.dart';

void main() {
  runApp(const AnimationPractice());
}

class AnimationPractice extends StatelessWidget {
  const AnimationPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginAnimation(),
      ),
    );
  }
}
