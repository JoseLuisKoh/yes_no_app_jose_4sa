import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/helpers/yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollcontroler = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();
  List<Message> message = [
    Message(text: 'Buen dia', fromWho: FromWho.me),
    Message(text: 'hola', fromWho: FromWho.me)
  ];
  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    message.add(newMessage);
    if (text.endsWith('?')) {
      amloReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> amloReply() async {
    final AlbeditoMessage = await getYesNoanswer.getAnswer();
    message.add(AlbeditoMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    chatScrollcontroler.animateTo(
        //extender el scroll lo maximo que se mueva
        chatScrollcontroler.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut);
  }
}
