//import 'dart:convert';

import 'package:realmofgames/Utente.dart';
import 'package:realmofgames/consoleDebug.dart';
import 'package:realmofgames/database/models.dart';
import 'package:realmofgames/serverDataHandler.dart';
import 'package:flutter/material.dart';
//import 'database/dao.dart';
//import 'database/database.dart';
//import 'Utente.dart';
import 'home.dart';
//import 'package:http/http.dart' as http;

class LoginApp extends StatefulWidget{
  const LoginApp({super.key});
  @override
  State<LoginApp> createState() => _LoginStateApp();

  
}

class _LoginStateApp extends State<LoginApp>{
  var nomeUtente="";
  var password="";
  var ipAddress="";
  
  
  String castingRecord(String response){
    String s="";
    
    s = response.substring(12, response.length-2);
    print(s);
    return s;
  }
  void showError(String s){
    print(s);
  }
  
  bool setParametersInUtente(Map <String,String>? mapData){

      if(mapData != null){
          Utente.e_mail=mapData["e_mail"]!;
          Utente.password=mapData["password"]!;
          Utente.nome=mapData["name"]!;
          
          //Utente.cognome=surname;
          //Utente.hasMadeLogin=true;
          getDao().then((value) {value.insertUtentedb(Utentedb(id: null, nome: Utente.nome, password: Utente.password, e_mail: Utente.e_mail, cognome: '', data_nascita: ''));value.getUtentedb().then((value){printdebug.printYellow(value[0].toString());});});
          setState(() {
              Navigator.pop(context);
        
          });
          
          return true;
          
      }
      else{
        return false;
      }
      
  }

  	@override
    Widget build(BuildContext context){
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        floatingActionButton: IconButton(onPressed: ()async{
                                      await Future.delayed(const Duration(milliseconds: 500));
                                      Utente.hasMadeLogin=setParametersInUtente(await serverDataHandler.fetchUser(nomeUtente, password));
                                      printdebug.printYellow('${Utente.hasMadeLogin}');
                                    }, icon: const Icon(Icons.login_rounded, size: 50,color: Color.fromARGB(255, 231,83,107),)),
        
        body: Padding(padding: const EdgeInsets.only(top: 100, left: 20, right: 20,bottom: 10),
                                  child: Column(children: [
                                    TextField(
                                      style: const TextStyle(color:  Color.fromARGB(255, 255, 255, 255)),
                                      decoration: const InputDecoration(border:  OutlineInputBorder(), labelText: 'Mail', enabledBorder:  OutlineInputBorder(
      // width: 0.0 produces a thin "hairline" border
                                                  borderSide: BorderSide(color: Color.fromARGB(255, 231,83,107), width: 2.0),), labelStyle:  TextStyle(color:  Color.fromARGB(255, 255, 255, 255)), ),
                                      onChanged: (value) => {nomeUtente=value},
                                    ),
                                    const Padding(padding: EdgeInsets.only(top:50)),
                                    TextField(
                                      style: const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(border:  OutlineInputBorder(), labelText: 'Password', enabledBorder:  OutlineInputBorder(
      // width: 0.0 produces a thin "hairline" border
                                                  borderSide: BorderSide(color: Color.fromARGB(255, 231,83,107), width: 2.0),), labelStyle:  TextStyle(color:  Color.fromARGB(255, 255, 255, 255)), ),
                                      onChanged: (value) => {password=value},
                                      obscureText: true,
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 50)),
                                    IconButton(onPressed: (){
                                      showDialog(context: context, builder:  (context) {
                                              return AlertDialog(
                                                
                                                title: const Text('Scegli l indirizzo ip'),
                                                content: TextField(
                                                  onChanged: (value) {
                                                    setState(() {
                                                      ipAddress = value;
                                                    });
                                                  },
                                                  
                                                  decoration: const InputDecoration(hintText: "Text Field in Dialog"),
                                                ),
                                                actions: <Widget>[
                                                      MaterialButton(
                                                        
                                                        color: const Color.fromARGB(255, 231,83,107),
                                                        textColor: Colors.white,
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                          setState(() {
                                                            serverDataHandler.setIpaddress(this.ipAddress);
                                                            Navigator.pop(context);
                                                          });
                                                        },
                                                      ),
                                                    ]) ;},
                                                  
                                                );                     
                                    }
                                    , icon: const Icon(Icons.network_locked_rounded, size: 50,color: Color.fromARGB(255, 231,83,107),))
                                  ]),
                                  

                    )
              );
    }
    

}