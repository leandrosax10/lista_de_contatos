import 'package:dio/dio.dart';
import 'package:lista_de_contatos/model/contatos_model.dart';

class ContatosRepository {
  var _dio = Dio();

  ContatosRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        "dTAv2oHCydEeUpQcaRtdEcJ0AkxlfM8VQO3ZyIVE";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "Kx42kPu63oowLCv2843EO5nf7Y2EQUBDTvCEY7cc";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<ContatosModel> obterContatos() async {
    var url = "/Contatos";
    var result = await _dio.get(url);
    return ContatosModel.fromJson(result.data);
  }

  Future<void> criar(ContatoBackModel contatoBackModel) async {
    try {
      await _dio.post("/Contatos", data: contatoBackModel.toCreateJson());
    } catch (e) {
      throw e;
    }
  }
}
