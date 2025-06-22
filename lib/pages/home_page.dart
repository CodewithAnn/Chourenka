import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            const SliverAppBar(
              title: Text('Image placeHolder'),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      color: Colors.red,
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0))
          ]),
        ));
  }
}
