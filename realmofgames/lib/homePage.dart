import 'dart:convert';
import 'package:realmofgames/Utente.dart';
import 'package:flutter/material.dart';
//import 'package:realmofgames/main.dart';
import 'package:http/http.dart' as http;
class SecondPageHome extends StatefulWidget {
  const SecondPageHome({super.key, required this.title});

  

  final String title;

  @override
  State<SecondPageHome> createState() => _mysecondPageHome();
}

class _mysecondPageHome extends State<SecondPageHome> {
  //int _counter = 0;
  /*
  String codiceUwu='';
  String nome='';
  String cognome='';
  String reparto='';
  */
  String e_mail="";
  //String password="";
  //String nome="";
  //String cognome = "";
  //late String data_nascita;
  //late String data_account;
  String ipaddress='';
  // ignore: unused_field
  Utente utenteLog=Utente.vuoto();
  String castingRecord(String response){
    String s="";
    s = response.substring(12, response.length-2);
    print(s);
    return s;
  }
  void showError(String s){
    print(s);
  }
  Future<void> fetchData(String e_mail, String password) async {
    //print('ciao');
    try{
      //print(e_mail);
      final response = await http.get(Uri.parse('http://192.168.1.100/htdocsAPI/getUtenteAPI.php?e_mail=${Utente.e_mail}'));//&password=${password}
      if (response.statusCode == 200) {
        //print(response.body.runtimeType);
        //print(response.body.length);
        //print(response.body);
        //castingRecord(response.body);
        

        Map <String, dynamic> map = jsonDecode(castingRecord(response.body));
        if (map['stato'] == 'ERRORE') {
          showError("URL non valido");
        } else if (map['stato'] == 'OK-2') {
          showError("codice inesistente");
        } else {
          setState(() {

            //print('cia');
            /* qui si gestiscono a livello client le variabili ricevute dal server rest*/
            //print(map);
            //e_mail = map['e_mail'];
            var e_mail1= map['e_mail'];
            var name = map['nome'];
            //cognome = map['cognome'];
            //print("ciao");
            var password1 = map['password'];

            var cognome1 = map['cognome'];
            
            
            
            
            utenteLog = Utente.concognome(e_mail1, password1, name, cognome1);
          });
          
        }
      } else {
        throw Exception('Failed to load data');
      }
    }catch(e){
      print(e);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    //fetchData('aaaa');
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Column(

        children: [
          //TextField(onChanged: ((value){ipaddress=value;}), decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Ipaddress')),
          TextField(onChanged:((value){Utente.e_mail=value;}),decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'email')),
          //Text('Il nome é $nome ; il cognome é $cognome; il reparto é $reparto')
          TextField(onChanged: ((value){Utente.password=value;}), decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'password')),
          Text(Utente.e_mail),
          
          Text(Utente.password),
          Text(Utente.nome),
          
        ],
        //child: 
        
      ),
       floatingActionButton: FloatingActionButton(onPressed: (){fetchData(Utente.e_mail, Utente.password);}),
    );
  }
}