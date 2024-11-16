import 'package:chinese_flashcard/enum/slide_direction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'swipe_provider.g.dart';
@riverpod
class Swipe extends _$Swipe {
  @override
  SlideDirection build() {
    return SlideDirection.none;
  }

  bool swipeCard2 = false;
  // Slide
  void runSwipeCard2({required SlideDirection direction}) {
    swipeCard2 = true;
    state = direction;
  }
}
