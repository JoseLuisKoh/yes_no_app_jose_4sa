enum FromWho {
  me,
  albeditos,
  mine,
}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;
  final bool isRead; // Agregar esta propiedad

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    DateTime? timestamp,
    this.isRead = false, // Estado inicial como "no leído"
  }) : timestamp = timestamp ?? DateTime.now();

  // Método para formatear la hora
  String getFormattedTime() {
    // Aquí puedes usar DateFormat de intl para formatear la hora
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
