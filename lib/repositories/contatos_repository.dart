import 'package:dio/dio.dart';
import 'package:lista_de_contatos/model/contatos_model.dart';

class ContatosRepository {
  Future<ContatosModel> obterContatos() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] = "dTAv2oHCydEeUpQcaRtdEcJ0AkxlfM8VQO3ZyIVE";
    dio.options.headers["X-Parse-REST-API-Key"] = "Kx42kPu63oowLCv2843EO5nf7Y2EQUBDTvCEY7cc";
    dio.options.headers["Content-Type"] = "application/json";
    var result =
        await dio.get("https://parseapi.back4app.com/classes/Contatos");
    return ContatosModel.fromJson(result.data);
  }
}
