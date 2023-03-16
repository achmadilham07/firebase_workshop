import 'package:flutter/material.dart';
import 'package:workshop/model/message.dart';

class MessageBubbleWidget extends StatelessWidget {
  final Message message;
  final bool isMyMessage;

  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.isMyMessage,
  });

  final senderBorderRadius = const BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
  final otherBorderRadius = const BorderRadius.only(
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            message.sender,
            // TODO-1: Add a TextAlign
          ),
          const SizedBox(height: 4),

          // TODO-5: Add a Align
          Container(
            decoration: BoxDecoration(
                // TODO-2: Add a Border

                // TODO-3: Add a Color

                ),
            padding: const EdgeInsets.all(16),
            child: Text(
              message.text,
              style: TextStyle(
                fontSize: 15,
                // TODO-4: Add a Color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
