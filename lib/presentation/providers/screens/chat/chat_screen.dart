import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/widgets/chat/share/message_box.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/presentation/providers/chat_provider.dart';
import 'package:flutter_application_1/presentation/providers/widgets/chat/albedito_message.dart';
import 'package:flutter_application_1/presentation/providers/widgets/chat/my_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albedo 💗'),
        leading: const Padding(
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/03/CBR-Featured-Images-Albedo-Overlord.jpg')),
        ),
      ),
      body: _chatview(),
    );
  }
}

class _chatview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatprovider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatprovider.chatScrollcontroler,
              itemCount: chatprovider.message.length,
              itemBuilder: (context, index) {
                final message = chatprovider.message[index];

                return (message.fromWho == FromWho.albeditos)
                    ? AlbeditoMessage(message: message)
                    : MyMessage(
                        message: message,
                      );
              },
            )),
            MessageBox(
              onValue: (value) => chatprovider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
