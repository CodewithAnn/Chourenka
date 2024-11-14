import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({super.key, required this.child});
  final Widget child;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeInAnimationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _fadeInAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    super.initState();
    _fadeInAnimation = Tween<double>(begin: 0.60, end: 1).animate(CurvedAnimation(
        parent: _fadeInAnimationController, curve: Curves.easeIn));
    // scale animation
    _scaleAnimation = Tween<double>(begin: 0.40, end: 1).animate(
        CurvedAnimation(
            parent: _fadeInAnimationController, curve: Curves.easeIn));
    _fadeInAnimationController.forward();
  }

  @override
  void dispose() {
   
    _fadeInAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeInAnimationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeInAnimation.value,
          child: Transform(
            alignment: Alignment.bottomCenter,
            transform: Matrix4.identity()..scale(_scaleAnimation.value),
            child: widget.child,
          ),
        );
      },
    );
  }
}
