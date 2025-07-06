import 'package:chinese_flashcard/bloc/flash_card/flash_card_cubit.dart';
import 'package:chinese_flashcard/configs/apptheme.dart';
import 'package:chinese_flashcard/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => FlashCardCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chinese FlashCard',
        debugShowCheckedModeBanner: false,
        theme: apptheme,
        home: const HomePage());
  }
}
