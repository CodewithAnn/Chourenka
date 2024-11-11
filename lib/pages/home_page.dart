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
                  (context, index) => Container(
                    color: Colors.red,
                  ),
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
