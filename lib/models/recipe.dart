import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    this.titulo,
    this.foto,
    this.porcoes,
    this.tempoPreparo,
    this.ingredientes,
    this.modoPreparo,
  });

  String titulo;
  String foto;
  String porcoes;
  String tempoPreparo;
  String ingredientes;
  String modoPreparo;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        titulo: json["titulo"],
        foto: json["foto"],
        porcoes: json["porcoes"],
        tempoPreparo: json["tempo_preparo"],
        ingredientes: json["ingredientes"],
        modoPreparo: json["modo_preparo"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "foto": foto,
        "porcoes": porcoes,
        "tempo_preparo": tempoPreparo,
        "ingredientes": ingredientes,
        "modo_preparo": modoPreparo,
      };
}
