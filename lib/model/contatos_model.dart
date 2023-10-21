class ContatosModel {
  List<ContatoBackModel> contatos = [];

  ContatosModel(this.contatos);

  ContatosModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contatos = <ContatoBackModel>[];
      json['results'].forEach((v) {
        contatos.add(ContatoBackModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = contatos.map((v) => v.toJson()).toList();
    return data;
  }
}

class ContatoBackModel {
  String objectId = "";
  String nome = "";
  String telefone = "";
  String email = "";
  String createdAt = "";
  String updatedAt = "";

  ContatoBackModel(this.objectId, this.nome, this.telefone, this.email, this.createdAt,
      this.updatedAt);

  ContatoBackModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    telefone = json['telefone'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['nome'] = nome;
    data['telefone'] = telefone;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
