import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({super.key, required this.child});
  final Widget child;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _fadeInAnimationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _fadeInAnimationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
    _scaleAnimation = Tween<double>(begin: 0.90, end: 1.0)
        .animate(CurvedAnimation(parent: _fadeInAnimationController, curve: Curves.easeIn));
    _fadeInAnimation = Tween<double>(begin: 0.90, end: 1.0)
        .animate(CurvedAnimation(parent: _fadeInAnimationController, curve: Curves.easeIn));

    //start the animation
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
      builder: (context, child) => Opacity(
        opacity: _fadeInAnimation.value,
        child: Transform(
          transform: Matrix4.identity()..scale(_scaleAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
