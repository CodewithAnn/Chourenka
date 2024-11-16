import 'package:chinese_flashcard/enum/slide_direction.dart';
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    required this.child,
    required this.slideDirection,
    this.animated = true,
    super.key,
  });
  final Widget child;
  final SlideDirection slideDirection;
  final bool animated;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<Offset> _SlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2300), vsync: this);

    // _SlideAnimation = Tween<Offset>(begin: Offset(-1.5, 0), end: Offset(0, 0))
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    if (widget.animated) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant SlideAnimation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.animated) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> _SlideAnimation;
    Tween<Offset> tween;

    switch (widget.slideDirection) {
      case SlideDirection.none:
        tween =
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0));
      case SlideDirection.leftAway:
        tween = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(-1.4, 0));
        break;
      case SlideDirection.rightAway:
        tween =
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1.4, 0));
        break;
      case SlideDirection.leftIn:
        tween = Tween<Offset>(
            begin: const Offset(-1.4, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.rightIn:
        tween =
            Tween<Offset>(begin: const Offset(1.4, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.upIn:
        tween =
            Tween<Offset>(begin: const Offset(0, 1.4), end: const Offset(0, 0));
        break;
      case SlideDirection.topIn:
        tween = Tween<Offset>(
            begin: const Offset(0, -1.4), end: const Offset(0, 0));
        break;
    }

    _SlideAnimation = tween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    return SlideTransition(
      position: _SlideAnimation,
      child: widget.child,
    );
  }
}
