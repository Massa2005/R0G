import 'package:realmofgames/Utente.dart';
import 'package:flutter/material.dart';
import 'serverDataHandler.dart';
import 'consoleDebug.dart';

class RegisterApp extends StatefulWidget{
  const RegisterApp({super.key});
  @override
  State<RegisterApp> createState() => _RegisterStateApp();

  
}
class _RegisterStateApp extends State<RegisterApp>{
  String e_mail='';
  String nome='';
  String cognome='';
  String data_nascita='';
  String password='';
  InputDecoration textFieldDecoration=const InputDecoration(border: OutlineInputBorder());
  InputDecoration setTextOnTextField(String text){
      InputDecoration textFieldDecoration=InputDecoration(border: const OutlineInputBorder(), labelText: text, enabledBorder: const OutlineInputBorder(
      // width: 0.0 produces a thin "hairline" border
      borderSide: BorderSide(color: Color.fromARGB(255, 231,83,107), width: 2.0),), labelStyle: const TextStyle(color:  Color.fromARGB(255, 255, 255, 255)), );
      return textFieldDecoration;

  }
  bool setParametersInUtente(Map <String,String>? mapData){// da finire
    if(mapData != null){
        Utente.e_mail = mapData!["e_mail"]!;
        Utente.nome = mapData["nome"]!;
        Utente.cognome = mapData["cognome"]!;
        Utente.data_nascita = mapData["data_nascita"]!;
        Utente.password = mapData["password"]!;
        setState(() {
              Navigator.pop(context);
        
          });
        return false;
    }
    else{
      return false;

    }
  }
  	@override
    Widget build(BuildContext context){
      
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        floatingActionButton: IconButton(onPressed: ()async{
                                      await Future.delayed(const Duration(milliseconds: 500));
                                      Utente.hasMadeLogin=setParametersInUtente(await serverDataHandler.fetchRegister(e_mail, password, cognome, nome, data_nascita));
                                      printdebug.printYellow('${Utente.hasMadeLogin}');
                                    }, icon: const Icon(Icons.login_rounded, size: 50,color:  Color.fromARGB(255, 231,83,107))),
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20,bottom: 10),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white) ,
                decoration: setTextOnTextField('e_mail'),
                onChanged: (value) {
                  e_mail=value;
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                style: const TextStyle(color: Colors.white) ,
                decoration: setTextOnTextField('nome'),
                onChanged: (value) {
                  nome=value;
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                style: const TextStyle(color: Colors.white) ,
                decoration: setTextOnTextField('congome'),
                onChanged: (value) {
                  cognome=value;
                },
                
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                style: const TextStyle(color: Colors.white) ,
                decoration: setTextOnTextField('data di nascita'),
                onChanged: (value) {
                  data_nascita=value;
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                style: const TextStyle(color: Colors.white) ,
                decoration: setTextOnTextField('password'),
                onChanged: (value) {
                  password=value;
                },
                obscureText: true,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              

            ],
          ),
        ),
        
      );
    }
}