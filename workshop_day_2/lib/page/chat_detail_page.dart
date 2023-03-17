import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  late FirebaseFirestore _firestore;
  late FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Chat"),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('dateCreated', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final json = snapshot.data!.docs[index];
                    final message = Message.fromMap(json.data());
                    final isMyMessage =
                        message.sender == _auth.currentUser?.email.toString();
                    return MessageBubbleWidget(
                      message: message,
                      isMyMessage: isMyMessage,
                    );
                  },
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
                    onPressed: () {
                      final text = messageController.text;
                      if (text.isNotEmpty) {
                        _firestore.collection('messages').add({
                          'text': text,
                          'sender': _auth.currentUser?.email,
                          'dateCreated': Timestamp.now().millisecondsSinceEpoch,
                        });
                        messageController.clear();
                      }
                    },
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
