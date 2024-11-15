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
        title: Text(flashCardTitle),
      ),
    );
  }
}
