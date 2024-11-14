import 'package:chinese_flashcard/configs/extenstions.dart';
import 'package:flutter/material.dart';

class TopicCards extends StatelessWidget {
  const TopicCards({
    super.key,
    required String topics,
  }) : _topics = topics;

  final String _topics;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("Card $_topics is selected");
        // Todo: add navigation to card screen
      },
      child: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: context.theme.primaryColor),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset("assets/images/$_topics.png"))),
            Expanded(child: Text(_topics)),
          ],
        ),
      ),
    );
  }
}
