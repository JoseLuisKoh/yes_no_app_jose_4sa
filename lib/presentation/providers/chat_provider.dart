import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/helpers/yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  // Controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  // Instancia de la clase GetYesNoAnswer
  final GetYesNoanswer getYesNoAnswer = GetYesNoanswer();

  List<Message> messageList = [];

  // Variable para la hora de envío del mensaje
  DateTime lastMessageTime = DateTime.now();

  // Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // Evita que se mande mensaje vacío
    if (text.trim().isEmpty) return;

    // Avanza unos minutos en la última hora del mensaje
    lastMessageTime = lastMessageTime.add(const Duration(minutes: 1));

    // El mensaje siempre va a ser 'me' porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // Agrega el nuevo mensaje a la lista
    messageList.add(newMessage);
    notifyListeners(); // Notifica a los listeners sobre el cambio en el estado

    // Respuesta automática si el mensaje termina con '?'
    if (text.endsWith('?')) {
      await herReply();
    }

    // Mueve el scroll al último mensaje
    await moveScrollToBottom();
  }

  // Función para recibir una respuesta
  Future<void> herReply() async {
    // Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    // Añadir el mensaje de respuesta a la lista
    messageList.add(herMessage);
    notifyListeners(); // Notifica a los listeners sobre el cambio en el estado

    // Mueve el scroll al último mensaje
    await moveScrollToBottom();
  }

  // Mover el scroll al último mensaje
  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(
        milliseconds: 100)); // Breve retraso para asegurar el desplazamiento

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
