import 'package:chinese_flashcard/animations/half_flip_animation.dart';
import 'package:chinese_flashcard/animations/slide_animation.dart';
import 'package:chinese_flashcard/configs/extenstions.dart';
import 'package:chinese_flashcard/enum/slide_direction.dart';
import 'package:chinese_flashcard/providers/flipcard/flip_card2_provider.dart';
import 'package:chinese_flashcard/providers/flipcard/flip_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Card1 extends ConsumerWidget {
  const Card1({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flipCard = ref.watch(flipCardProvider);
    final flipCard2 = ref.watch(flipCard2Provider);
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    return GestureDetector(
      onDoubleTap: () {
        ref.read(flipCardProvider.notifier).runFlipCard();
      },
      child: HalfFlipAnimation(
        animate: ref.read(flipCardProvider.notifier).flipCard1,
        reset: false,
        animationCompleted: () {
          ref.read(flipCard2Provider.notifier).runFlipCard2();
        },
        flipFromHalfWay: false,
        child: SlideAnimation(
          slideDirection: SlideDirection.upIn,
          child: Container(
            color: context.theme.primaryColor,
            width: width * 0.70,
            height: height * 0.60,
          ),
        ),
      ),
    );
  }
}
