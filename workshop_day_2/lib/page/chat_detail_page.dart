import 'package:flutter/material.dart';
import 'package:workshop/model/message.dart';
import 'package:workshop/widget/message_bubble_widget.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController messageController = TextEditingController();

  final messages = [
    Message(
      text: "Kamu lagi di mana?",
      sender: "belajarubic01@gmail.com",
      dateCreated: DateTime(2023, 01, 13, 18, 30, 45),
    ),
    Message(
      text: "Belajar di perpus kampus, kamu?",
      sender: "achmadilham07@gmail.com",
      dateCreated: DateTime(2023, 01, 13, 18, 30, 48),
    ),
    Message(
      text:
          "Aku lagi di kantin kampus.\nKamu ndak mau ngerjakan di kantin aja?",
      sender: "belajarubic01@gmail.com",
      dateCreated: DateTime(2023, 01, 13, 18, 30, 50),
    ),
    Message(
      text: "Gak mau, aku mau fokus belajar di perpus dan ingin menyendiri.",
      sender: "achmadilham07@gmail.com",
      dateCreated: DateTime(2023, 01, 13, 18, 30, 55),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMyMessage = message.sender == "achmadilham07@gmail.com";
                return MessageBubbleWidget(
                  message: message,
                  isMyMessage: isMyMessage,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        gapPadding: 0,
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                          color: Colors.transparent,
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: "Message",
                      filled: true,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: FloatingActionButton(
                    onPressed: () {},
                    elevation: 0,
                    mini: true,
                    highlightElevation: 0,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: const Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
