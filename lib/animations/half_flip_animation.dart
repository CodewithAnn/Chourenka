// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'dart:math' show pi;

class HalfFlipAnimation extends StatefulWidget {
  const HalfFlipAnimation({
    super.key,
    required this.child,
    required this.animate,
    required this.reset,
    required this.flipFromHalfWay,
    required this.animationCompleted,
  });

  final Widget child;
  final bool animate;
  final bool reset;
  final bool flipFromHalfWay;
  final VoidCallback animationCompleted;

  @override
  State<HalfFlipAnimation> createState() => _HalfFlipAnimationState();
}

class _HalfFlipAnimationState extends State<HalfFlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration:const Duration(milliseconds: 1000), vsync: this)
          ..addListener(
            () {
              if (_animationController.isCompleted) {
                widget.animationCompleted.call();
              }
            },
          );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HalfFlipAnimation oldWidget) {
    if (widget.reset) {
      _animationController.reset();
    }

    if (widget.animate) {
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double rotationAdjustment = 0.0;
    if (widget.flipFromHalfWay) {
      rotationAdjustment = pi / 2;
    }
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY((_animationController.value * pi) / 2)
            ..rotateY(rotationAdjustment),
          child: widget.child,
        );
      },
    );
  }
}
