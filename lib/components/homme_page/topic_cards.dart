import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chinese_flashcard/configs/extenstions.dart';
import 'package:chinese_flashcard/utils/methods.dart';
import 'package:flutter/material.dart';

class TopicCards extends ConsumerWidget {
  const TopicCards({
    super.key,
    required String topics,
  }) : _topics = topics;

  final String _topics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        debugPrint("Card $_topics is selected");
        sessionMethod(context: context, topic: _topics, ref: ref);
      },
      child: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: context.theme.primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Hero(
                        tag: _topics,
                        child: Image.asset("assets/images/$_topics.png")))),
            Padding(
              padding: const EdgeInsets.only(
                left: 6.0,
                right: 6.0,
                bottom: 4.0,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  _topics,
                  // overflow: TextOverflow.clip,
                  // maxLines: 2,
                  softWrap: false,

                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
