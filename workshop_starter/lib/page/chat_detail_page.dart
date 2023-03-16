import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Chat"),
      ),
      body: Column(
        children: [
          // TODO-1: Add a list of message

          // TODO-2: Add a Coloum and Button to type a text and send button
        ],
      ),
    );
  }
}
