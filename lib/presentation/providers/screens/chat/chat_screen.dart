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
        leading: const Padding(
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/03/CBR-Featured-Images-Albedo-Overlord.jpg'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Isa💗'),
            SizedBox(height: 4),
            Text(
              'En línea',
              style: TextStyle(
                color: Colors.green,
                fontSize: 12, // Estilo para indicar que está en línea
              ),
            ),
          ],
        ),
      ),
      body: _chatview(),
    );
  }
}

class _chatview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pedir al widget que esté pendiente de todos los cambios
    final chatprovider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatprovider.chatScrollController,
                itemCount: chatprovider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatprovider.messageList[index];

                  return (message.fromWho == FromWho.albeditos)
                      ? AlbeditoMessage(message: message)
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            MessageBox(
              onValue: (value) => chatprovider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
