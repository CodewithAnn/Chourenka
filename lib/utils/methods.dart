import 'package:chinese_flashcard/pages/flashcard_page.dart';
import 'package:chinese_flashcard/providers/flashcard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [session ] mehtod used to navigate to the flashcard page.
void sessionMethod(
    {required BuildContext context,
    required String topic,
    required WidgetRef ref}) {
      final topicProvider = ref.watch(flashCardProvider);
  // Navigate to flashcard page
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const FlashcardPage(),
  ));
  ref.read(flashCardProvider.notifier).setTopic(topic: topic);
}
