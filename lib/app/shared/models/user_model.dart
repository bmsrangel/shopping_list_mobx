import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String nome;
  String sobrenome;
  String email;
  String senha;

  UserModel({
    this.id,
    this.nome,
    this.sobrenome,
    this.email,
    this.senha,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nome: json["nome"],
        sobrenome: json["sobrenome"],
        email: json["email"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "sobrenome": sobrenome,
        "email": email,
        "senha": senha,
      };
}
