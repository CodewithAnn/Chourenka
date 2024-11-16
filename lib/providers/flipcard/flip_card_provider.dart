import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flip_card_provider.g.dart';
@riverpod
class FlipCard extends _$FlipCard {
  @override
  bool build() {
    
    return false;
  }

   bool flipCard1= false;
  void runFlipCard(){
    flipCard1 = true;
    state = flipCard1;
  }
}