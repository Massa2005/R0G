
import 'package:floor/floor.dart';



@entity
class Gioco{
  Gioco({required this.id, required this.nome,required this.descrizione, required this.prezzo, required this.sconto, required this.mail_editore, required this.main_img, required this.valutazione, required this.data_pubblicazione});


  

  @primaryKey
  final int? id;

  final String nome;
  final String descrizione;
  final String prezzo;
  final String sconto;
  final String mail_editore;
  final String main_img;
  final String valutazione;
  final String data_pubblicazione;
  
}
/*
@Entity(tableName: "Comment", foreignKeys: [ForeignKey(childColumns: ["postid"], parentColumns: ["id"], entity: Post)])
class Comment {
  Comment({required this.id, required this.text, this.checked = false, required this.postid});

  @primaryKey
  final int? id;
  
  
  final int postid;

  final String text;
  bool checked;
}
*/

@entity
class Utentedb{
  Utentedb({required this.id, required this.nome,required this.password,required this.e_mail, required this.cognome, required this.data_nascita});

  @primaryKey
  final int? id;


  final String nome;
  final String password;
  final String e_mail;
  final String cognome;
  final String data_nascita;
  

}
@entity
class NetworkSpec{
  NetworkSpec({required this.id, required this.ipaddress});
  @primaryKey
  final int id;

  final String ipaddress;
}