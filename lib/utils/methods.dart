import 'package:chinese_flashcard/bloc/flash_card/flash_card_cubit.dart';
import 'package:chinese_flashcard/pages/flashcard_page.dart';
import 'package:chinese_flashcard/providers/flashcard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [session ] mehtod used to navigate to the flashcard page.
void sessionMethod({
  required BuildContext context,
  required String topic,
}) {
  // Navigate to flashcard page
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => const FlashcardPage(),
  ));
  BlocProvider.of<FlashCardCubit>(context, listen: false).setTopic(topic: topic);
}
