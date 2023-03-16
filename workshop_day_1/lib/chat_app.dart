import 'package:flutter/material.dart';
import 'package:workshop/page/chat_detail_page.dart';

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatDetailPage(),
    );
  }
}