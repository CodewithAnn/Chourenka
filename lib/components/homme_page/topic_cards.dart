import 'package:chinese_flashcard/configs/extenstions.dart';
import 'package:chinese_flashcard/utils/methods.dart';
import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    super.key,
    required String topic,
  }) : _topic = topic;

  final String _topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> sessionMethod(context: context, topic: _topic),
      child: Container(
        decoration:
            BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
                child: Image.asset("assets/images/$_topic.png"),
              ),
            ),
            Expanded(child: Text(_topic)),
          ],
        ),
      ),
    );
  }
}
