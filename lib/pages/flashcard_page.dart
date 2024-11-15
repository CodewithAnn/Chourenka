import 'package:chinese_flashcard/providers/flashcard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashcardPage extends ConsumerStatefulWidget {
  const FlashcardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends ConsumerState<FlashcardPage> {
  @override
  Widget build(BuildContext context) {
    final flashCardTitle = ref.watch(flashCardProvider);
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
                tag: flashCardTitle,
                // createRectTween: ,
                flightShuttleBuilder: (
                  flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,
                ) {
                  switch (flightDirection) {
                    case HeroFlightDirection.push:
                      //
                      return Material(
                        color: Colors.transparent,
                        child: SlideTransition(
                            position: animation.drive(Tween<Offset>(
                                begin: Offset(0, 0), end: Offset(0, 0))),
                            child: toHeroContext.widget),
                      );
                    case HeroFlightDirection.pop:
                      return Material(
                        color: Colors.transparent,
                        child: fromHeroContext.widget,
                      );
                  }
                },
                child: Image.asset(
                  "assets/images/${flashCardTitle}.png",
                  height: 48,
                )),
            SizedBox(
              width: 16,
            ),
            Text(flashCardTitle),
          ],
        ),
        // leading:
      ),
    );
  }
}
