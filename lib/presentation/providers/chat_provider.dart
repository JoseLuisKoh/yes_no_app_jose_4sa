import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/helpers/yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollcontroler = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();
  List<Message> message = [
    Message(
      text: 'Buen dia',
      fromWho: FromWho.me,
      content: '',
    ),
    Message(
      text: 'hola',
      fromWho: FromWho.me,
      content: '',
    )
  ];
  Future<void> sendMessage(String text) async {
    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
      content: '',
    );
    if (text.trim().isEmpty) {
      print("No se puede enviar un mensaje vacio.");

      return;
    }
    message.add(newMessage);
    moveScrollToBottom();
    print("Mensaje enviado: $message");

    if (text.endsWith('?')) {
      albeditoreplay();
    }
    //notifica si algo de provier cambio de estado
    notifyListeners();
    //mueve el scroll hasta el ultimo mensaje recibido
    moveScrollToBottom();
  }

  Future<void> albeditoreplay() async {
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
    print("numero de mensajes");
    print(message.length);
  }
}
