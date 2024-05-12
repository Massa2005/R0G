import 'dart:convert';
import 'package:realmofgames/consoleDebug.dart';
import 'package:realmofgames/database/dao.dart';
import 'package:realmofgames/database/models.dart';
import 'package:realmofgames/loginPage.dart';
import 'game.dart';
import 'database/database.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

class serverDataHandler{
  final int inexistent = 10;
  
  
  static String ipAddress='';
  static setIpaddress(String ip){
      ipAddress=ip;
      printdebug.printYellow(ip);
      
      getDao().then((value){value.updateNetworkSpec(NetworkSpec(id:0,ipaddress: ip));});
  }

  static getIpCorrected()async {
    await getDao().then((value){
        value.getNetworkSpec().then((value) {
          ipAddress=value[0].ipaddress;

        });
    });
  }
  static Future<Map<String,String>?> fetchUser(String e_mail, String password) async { // funzione che mi ritorna una lista di parametri in modo asincrono
    await getIpCorrected();
    try{
      Map<String,String> mapData={};
      
      printdebug.printYellow('-----------------------sono dentro la fetch');
      final response = await http.get(Uri.parse('http://${ipAddress}/htdocsAPI/getUtenteWithPassword.php?e_mail=${e_mail}&&password=${password}'));//&password=${password}
      printdebug.printYellow('${response.statusCode}');
      if (response.statusCode == 200) { //se il codice é corretto
        
        

          Map <String, dynamic> map = jsonDecode(castingRecordOfUser(response.body));
        
            var e_mail= map['e_mail'];
            var name = map['nome'];
            //cognome = map['cognome'];
            
            var password = map['password'];

            //var cognome = map['cognome'];
            
            mapData["e_mail"]=e_mail;
            mapData['name']=name;
            mapData["password"]=password;
            
            
            
            
            printdebug.printYellow("---------------------------------->log-in avvenuto con successo");
            
          
          
          
            return mapData;
      }
      else if(response.statusCode == 500){
        showError('codice inesistente');
      }
      else if(response.statusCode == 400){
        showError('password sbagliata');
      }
       else {
        throw Exception('Failed to load data');
      }
      
    }catch(e){
      print(e);
    }
    
  }
  static Future<Map<String,String>?> fetchRegister(String e_mail, String password, String cognome, String nome, String data_nascita) async { // funzione che attraverso il metodo post, crea un nuovo utente: e_mail, nome, cognome, data_di_nascita, password
    await getIpCorrected();
    
    try{
      Map<String,String> mapData={"e_mail":e_mail, "nome":nome, "cognome":cognome, "data_nascita":data_nascita, "password":password};
      
      printdebug.printYellow('-----------------------sono dentro la fetch');
      

      final response = await http.post(Uri.parse('http://${ipAddress}/htdocsAPI/addUtenteAPI.php'),body: jsonEncode(mapData));//&password=${password}
      printdebug.printYellow('${response.statusCode}');
      if (response.statusCode == 200) { //se il codice é corretto
        
            
            
            printdebug.printYellow("---------------------------------->tutto bene");
            


          
          
            return mapData;
      }else if(response.statusCode == 400){
        showError('something gone wrong creating the user');
      }
      else if(response.statusCode == 500){
        showError('something gone with getting the information');
      }
      
       else {
        throw Exception('Failed to load data');
      }
      
    }catch(e){
      print(e);
    }
    
  }


  
  
  static void showError(String s){
    printdebug.printYellow(s);
  }
  static String castingRecordOfUser(String response){
    String s="";
    s = response.substring(12, response.length-2);
    
    return s;
  }
  static String castingRecordOfImages(String response){
    String s="";
    
    s = response.substring(11, response.length-1);
    print(s.length);
    print(s);

    return s;
  }
  //
  static Future<List<Game>?> fetchGames() async { // funzione che attraverso il metodo post, crea un nuovo utente: e_mail, nome, cognome, data_di_nascita, password
    await getIpCorrected();
    printdebug.printYellow(ipAddress);
    
    try{
      Map<String,Game> mapData={};
      
      printdebug.printYellow('-----------------------sono dentro la fetch');
      

      final response = await http.get(Uri.parse('http://${ipAddress}/htdocsAPI/getGamesAPI.php'));//&password=${password}
      printdebug.printYellow('${response.statusCode}');
      if (response.statusCode == 200) { //se il codice é corretto
        
            //List<dynamic> listaMappe=jsonDecode(castingRecordOfImages(response.body));
            //castingRecordOfUser(response.body);
            //printdebug.printYellow("---------------------------------->tutto bene");
            //printdebug.printYellow(response.body.length);

            //printdebug.printYellow(response.body[0]);
            //printdebug.printYellow(response.body[1995]);

            //printdebug.printYellow('${response.contentLength}');
            List<Game> gameList= gameBhoFromJson(castingRecordOfImages(response.body));
            //print(gameList);

          
            return gameList;
      }else if(response.statusCode == 400){
        showError('something gone wrong creating the user');
      }
      else if(response.statusCode == 500){
        showError('something gone with getting the information');
      }
      
       else {
        throw Exception('Failed to load data');
      }
      
    }catch(e){
      print(e);
    }
    
  }
  static Future<List<Game>?> fetchGamesonSearch(String textFieldInput) async { // funzione che attraverso il metodo post, crea un nuovo utente: e_mail, nome, cognome, data_di_nascita, password
    await getIpCorrected();
    
    try{
      Map<String,Game> mapData={};
      
      printdebug.printYellow('-----------------------sono dentro la fetch');
      

      final response = await http.get(Uri.parse('http://${ipAddress}/htdocsAPI/searchGame.php?nome=${textFieldInput}'));//&password=${password}
      printdebug.printYellow('${response.statusCode}');
      if (response.statusCode == 200) { //se il codice é corretto
        
            //List<dynamic> listaMappe=jsonDecode(castingRecordOfImages(response.body));
            //castingRecordOfUser(response.body);
            //printdebug.printYellow("---------------------------------->tutto bene");
            //printdebug.printYellow(response.body.length);

            //printdebug.printYellow(response.body[0]);
            //printdebug.printYellow(response.body[1995]);

            //printdebug.printYellow('${response.contentLength}');
            List<Game> gameList= gameBhoFromJson(castingRecordOfImages(response.body));
            print(gameList);

          
            return gameList;
      }else if(response.statusCode == 400){
        showError('something gone wrong creating the user');
      }
      else if(response.statusCode == 500){
        showError('something gone with getting the information');
      }
      
       else {
        throw Exception('Failed to load data');
      }
      
    }catch(e){
      print(e);
    }
    
  } 
  
}