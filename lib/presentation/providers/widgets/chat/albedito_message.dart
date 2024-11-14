import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:intl/intl.dart';

class AlbeditoMessage extends StatelessWidget {
  final Message message;
  const AlbeditoMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Muestra la imagen solo si `imageUrl` no es nulo
        if (message.imageUrl != null && message.imageUrl!.isNotEmpty)
          _ImageBubble(
              imageUrl: message.imageUrl!, timeSent: message.timestamp),

        // Mostrar la hora
        Text(
          timeFormat.format(message.timestamp),
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  final DateTime timeSent;

  const _ImageBubble({required this.imageUrl, required this.timeSent});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Albedito is sending a gif'),
          );
        },
      ),
    );
  }
}
