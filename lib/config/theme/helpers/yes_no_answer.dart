import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infrastructure/models/yes._no_model.dart';

class GetYesNoanswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    //Almacenar la peticion GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');
    //Almacenar la data de la respuesta en una variable
    final yesnomodel = YesNoModel.fromJsonMap(response.data);
    //Devolver la instancia de "message" creada en el modelo
    return yesnomodel.toMessageEntitie();

    //generador de error
  }
}
