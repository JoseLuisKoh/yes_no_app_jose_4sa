import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infrastructure/models/yes._no_model.dart';

class GetYesNoanswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesnomodel = YesNoModel.fromJsonMap(response.data);
    return yesnomodel.toMessageEntitie();

    //generador de error
  }
}
