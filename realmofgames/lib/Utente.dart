class Utente{
  static String password = '';
  static String nome= '';
  static String e_mail= '';
  static String cognome= '';
  static String data_nascita="";
  static bool hasMadeLogin=false;
  Utente.senzacognome(e_mail,password, nome);
  Utente.concognome(e_mail,password, nome, cognome);
  Utente.vuoto();
  @override
  String toString() {
    // TODO: implement toString
    return e_mail;
  }
}