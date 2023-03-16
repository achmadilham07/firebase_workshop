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
            textAlign: isMyMessage ? TextAlign.right : TextAlign.left,
          ),
          const SizedBox(height: 4),
          Align(
            alignment:
                isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    isMyMessage ? senderBorderRadius : otherBorderRadius,
                color: isMyMessage
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMyMessage ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
