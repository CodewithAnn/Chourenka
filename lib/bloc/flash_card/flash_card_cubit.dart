import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'flash_card_state.dart';

class FlashCardCubit extends Cubit<FlashCardState> {
  FlashCardCubit() : super(const FlashCardState());
  //set topic and navigate to each topic page.
  void setTopic({required String topic}) {
    emit(state.copyWith(topic: topic));
  }
}
