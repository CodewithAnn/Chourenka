import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({required this.child, super.key});
  final Widget child;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _SlideAnimation;

  @override
  void initState() {
   
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    _SlideAnimation = Tween<Offset>(begin: Offset(-1.5, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _SlideAnimation,
      child: widget.child,
    );
  }
}
