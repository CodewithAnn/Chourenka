import 'package:chinese_flashcard/animations/fadein_animation.dart';
import 'package:chinese_flashcard/components/homme_page/topic_cards.dart';
import 'package:chinese_flashcard/configs/extenstions.dart';
import 'package:chinese_flashcard/data/words.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// dummy data list currently
  final List<String> _topics = [];

  @override
  void initState() {
    // add the topics in list
    for (var topic in words) {
      if (!_topics.contains(topic.topic)) {
        _topics.add(topic.topic);
      }
      _topics.sort();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.10,
          //round the bottom-left and bottom-right corners of Appbar
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0), bottomRight: Radius.circular(32.0))),
          title: const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                  text: "Chinese Flashcard",
                ),
                TextSpan(
                  text: "\n中文抽认卡",
                  style: TextStyle(color: Colors.yellow),
                ),
              ])),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              expandedHeight: size.height * 0.32,
              flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                padding: EdgeInsets.all(size.width * 0.10),
                child: FadeInAnimation(child: Image.asset('assets/images/drangon.png')),
              )),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: _topics.length,
                  (context, index) {
                    return TopicTile(topic: _topics[index]);
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0))
          ]),
        ));
  }
}
