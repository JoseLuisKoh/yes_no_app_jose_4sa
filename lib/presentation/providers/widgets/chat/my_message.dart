import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        // Fila que muestra la hora y el estado de "Leído"
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 5),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Ajusta el tamaño del Row al contenido
            children: [
              // Mostrar la hora
              Text(
                message.getFormattedTime(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 5), // Espacio entre la hora y el ícono

              // Mostrar el ícono de "Leído" y el texto correspondiente
              if (message.fromWho == FromWho.me) ...[
                Icon(
                  Icons.done_all,
                  size: 14,
                  color: message.isRead ? Colors.blue : Colors.blue,
                ),
                const SizedBox(width: 2), // Espacio entre el ícono y el texto
                Text(
                  message.isRead ? 'Leído' : 'Enviado',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
