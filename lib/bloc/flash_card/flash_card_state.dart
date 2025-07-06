// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'flash_card_cubit.dart';

class FlashCardState extends Equatable {
  const FlashCardState({this.topic = ''});
    final String topic;  

  FlashCardState copyWith({
    String? topic,
  }) {
    return FlashCardState(
      topic: topic ?? this.topic,
    );
  }
  @override
  List<Object> get props => [topic];
}

