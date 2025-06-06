import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chatapp/data/model/chat_model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool showTime;

  const MessageBubble({
    super.key,
    required this.message,
    required this.showTime,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: message.isUser
                  ? Colors.teal[400]?.withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: message.isUser
                    ? const Radius.circular(16)
                    : Radius.zero,
                bottomRight: message.isUser
                    ? Radius.zero
                    : const Radius.circular(16),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          if (showTime)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                DateFormat('hh:mm a').format(message.time),
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }
}
