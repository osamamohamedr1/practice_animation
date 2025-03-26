// import 'package:flutter/material.dart';

// class ScaleAnimation extends StatefulWidget {
//   const ScaleAnimation({super.key});

//   @override
//   _ScaleAnimationState createState() => _ScaleAnimationState();
// }

// class _ScaleAnimationState extends State<ScaleAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 400),
//     )..repeat(reverse: true);

//     _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ScaleTransition(
//             scale: _animation,
//             child: Icon(
//               Icons.favorite,
//               color: Colors.red,
//               size: 80,
//             )),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class DecoratedBoxTransitionExample extends StatefulWidget {
//   const DecoratedBoxTransitionExample({super.key});

//   @override
//   _DecoratedBoxTransitionExampleState createState() =>
//       _DecoratedBoxTransitionExampleState();
// }

// class _DecoratedBoxTransitionExampleState
//     extends State<DecoratedBoxTransitionExample>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Decoration> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat(reverse: true);

//     _animation = DecorationTween(
//       begin: BoxDecoration(
//           color: Colors.red, borderRadius: BorderRadius.circular(0)),
//       end: BoxDecoration(
//           color: Colors.green, borderRadius: BorderRadius.circular(30)),
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DecoratedBoxTransition(
//           decoration: _animation,
//           child: SizedBox(width: 100, height: 100),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class DefaultTextStyleTransitionExample extends StatefulWidget {
//   const DefaultTextStyleTransitionExample({super.key});

//   @override
//   _DefaultTextStyleTransitionExampleState createState() =>
//       _DefaultTextStyleTransitionExampleState();
// }

// class _DefaultTextStyleTransitionExampleState
//     extends State<DefaultTextStyleTransitionExample>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<TextStyle> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat(reverse: true);

//     _animation = TextStyleTween(
//       begin: TextStyle(fontSize: 20, color: Colors.black),
//       end: TextStyle(fontSize: 30, color: Colors.blue),
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DefaultTextStyleTransition(
//           style: _animation,
//           child: Text("Flutter"),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(1, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(width: 100, height: 100, color: Colors.purple),
        ),
      ),
    );
  }
}
