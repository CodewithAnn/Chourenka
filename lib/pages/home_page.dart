import 'package:chinese_flashcard/components/homme_page/topic_cards.dart';
import 'package:chinese_flashcard/data/words.dart';
import 'package:chinese_flashcard/model/word.dart';
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
    // TODO: implement initState
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
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        toolbarHeight: size.height * 0.15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0))),
        title: Text('Chinese FlashCard'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: paddingWidth, right: paddingWidth),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.cyanAccent,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: Text("Homepage image"),
                ),
              ),
            ),
            //
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: _topics.length,
                  (context, index) => TopicCards(topics: _topics[index]),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0))
          ],
        ),
      ),
    );
  }
}
