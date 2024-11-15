import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard_provider.g.dart';
@riverpod
class FlashCard extends _$FlashCard {
  @override
  String build() {
    String topic = "Topic";
    return topic;
  }

  setTopic({required String topic}) {
    state = topic;
  }
}
