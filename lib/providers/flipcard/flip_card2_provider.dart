import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flip_card2_provider.g.dart';

@riverpod
class FlipCard2 extends _$FlipCard2 {
  @override
  bool build() {
    return false;
  }

  bool flipCard2 = false;
  void runFlipCard2() {
    flipCard2 = true;
    state = flipCard2;
  }
}
