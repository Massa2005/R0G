
import 'dart:convert';
/*
class Game{
  int id=-1;
  String nome="";
  double costo=-1;
  double sconto=-1;
  String mail_editore="";
  String main_img="";
  String valutazione="";
  String data_pubblicazione="";

  Game.init(this.id, this.nome, this.costo, this.sconto, this.mail_editore, this.main_img, this.valutazione, this.data_pubblicazione);
}
*/
// To parse this JSON data, do
//
//     final gameBho = gameBhoFromJson(jsonString);



// To parse this JSON data, do
//
//     final gameBho = gameBhoFromJson(jsonString);



List<Game> gameBhoFromJson(String str) => List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));

String gameBhoToJson(List<Game> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Game {
    int? id;
    String? nome;
    String? descrizione;
    String? prezzo;
    String? sconto;
    String? mail_editore;
    String? main_img;
    String? valutazione;
    String? data_pubblicazione;

    Game({
        this.id,
        this.nome,
        this.descrizione,
        this.prezzo,
        this.sconto,
        this.mail_editore,
        this.main_img,
        this.valutazione,
        this.data_pubblicazione,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        nome: json["nome"],
        descrizione: json["descrizione"],
        prezzo: json["prezzo"].toString(),
        sconto: json["sconto"].toString(),
        mail_editore: json["mail_editore"],
        main_img: json["main_img"],
        valutazione: json["valutazione"].toString(),
        data_pubblicazione: json["data_pubblicazione"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descrizione": descrizione,
        "prezzo": prezzo,
        "sconto": sconto,
        "mail_editore": mail_editore,
        "main_img": main_img,
        "valutazione": valutazione,
        "data_pubblicazione": data_pubblicazione,
    };
}

