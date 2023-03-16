import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/page/chat_detail_page.dart';
import 'package:workshop/provider/user_provider.dart';

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ChatDetailPage(),
        );
      },
    );
  }
}
