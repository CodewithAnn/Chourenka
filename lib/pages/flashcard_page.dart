import 'dart:developer';

import 'package:chinese_flashcard/bloc/flash_card/flash_card_cubit.dart';
import 'package:chinese_flashcard/components/flashcard_pages/card1.dart';
import 'package:chinese_flashcard/components/flashcard_pages/card2.dart';
import 'package:chinese_flashcard/pages/home_page.dart';
import 'package:chinese_flashcard/providers/flashcard_provider.dart';
import 'package:chinese_flashcard/providers/flipcard/flip_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashcardPage extends ConsumerStatefulWidget {
  const FlashcardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends ConsumerState<FlashcardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashCardCubit, FlashCardState>(
      builder: (context, state) {
        log("${state.topic}");
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.clear))
            ],
            title: Text(state.topic),
          ),
        );
      },
    );
  }
}
