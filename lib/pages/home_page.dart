import 'package:chinese_flashcard/components/homme_page/topic_cards.dart';
import 'package:chinese_flashcard/configs/constants.dart';
import 'package:chinese_flashcard/configs/extenstions.dart';
import 'package:chinese_flashcard/data/words.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _topics = [];

  @override
  void initState() {
    super.initState();
    for (var t in words) {
      if (!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
      _topics.sort();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingWidth = size.width * 0.04;
    return Scaffold(
      // backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
          // backgroundColor: context.theme.primaryColor,
          centerTitle: true,
          // titleTextStyle: context.theme.appBarTheme.titleTextStyle,
          toolbarHeight: size.height * 0.15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0))),
          title: const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                  text: "Chinese Flashcard",
                ),
                TextSpan(
                  text: "\n中文抽认卡",
                  style: TextStyle(color: kYellow),
                ),
              ]))),
      body: Padding(
        padding: EdgeInsets.only(left: paddingWidth, right: paddingWidth),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: Image.asset("assets/images/drangon.png"),
                ),
              ),
            ),
            //
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: _topics.length,
                  (context, index) => TopicCards(topics: _topics[index]),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0))
          ],
        ),
      ),
    );
  }
}
