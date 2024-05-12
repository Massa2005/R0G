//import 'dart:convert';
// ignore_for_file: sort_child_properties_last

import 'package:realmofgames/database/models.dart';
import 'package:realmofgames/gamePage.dart';
import 'package:realmofgames/libreriaPage.dart';
import 'package:realmofgames/registerPage.dart';
import 'package:realmofgames/serverDataHandler.dart';
//import 'package:realmofgames/styleModels.dart';
import 'searchPage.dart';

import 'game.dart';
import 'consoleDebug.dart';
import 'package:realmofgames/Utente.dart';
import 'package:realmofgames/loginPage.dart';
import 'package:flutter/material.dart';


import 'database/dao.dart';
import 'database/database.dart';
Future<GiocoDao> getDao() async {
    AppDatabase database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database.giocodao;
}
//import 'package:http/http.dart' as http;
class HomeApp extends StatefulWidget{
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => _MyHomeAppState.initState();
}
class _MyHomeAppState extends State<HomeApp>{
  
  _MyHomeAppState.initState(){
    //Utentedb? listUserAtRunTime;

    getDao().then((value){value.getUtentedb().then((value){printdebug.printYellow(value[0].e_mail);//controllo della presenza di un account nell database per effetturare il login automatico
      if(value.isNotEmpty){
          //listUserAtRunTime=value[0];
          
          settingStaticUserInformation(value[0].e_mail, value[0].password, value[0].nome);
          //printdebug.printYellow(toString());
          setState(() {
          
        });
      }
      });});


      getDao().then((value){value.getNetworkSpec().then((value){//per impostare l'inidirizzo ip nella memoria dal database
        if(value.isNotEmpty){
          print(value[0]);
          serverDataHandler.ipAddress=value[0].ipaddress;
          
        }
        else{
          insertFirstNetworkAssett();
        }
        
      });});
      
      
      
    
    
  }

  //var UserHasLoggedIn;
  var optionContainerX=0;
  var optionContainerY=0;
  var positionOfTendina=const EdgeInsets.only(left: 500);
  var tendinaIsOut=true;
  //var alignmentOfContainer=Alignment.centerRight;
  void insertFirstNetworkAssett(){
    getDao().then((value){value.insertNetworkSpec(NetworkSpec(id: 0, ipaddress: ''));});
  }
  bool settingStaticUserInformation(String e_mail, String password, String nome){
      Utente.e_mail=e_mail;
      Utente.nome=nome;
      Utente.password=password;
      Utente.hasMadeLogin=true;
      return true;
  }
  void updateAfterLogged(){
    setState(() {
      //printdebug.printYellow('sono dentro il setSate');
      optionContainerMove();

    });
  }
  void optionContainerSetUp(){

    setState(() {
      if(tendinaIsOut){
        positionOfTendina= const EdgeInsets.only(left: 200);
        tendinaIsOut=false;
      }
      else{
        positionOfTendina=const EdgeInsets.only(left: 500);
        tendinaIsOut=true;
      }
    });
  }
  void optionContainerMove(){
    //getDao().then((value) {value.getUtentedb().then((value){printdebug.printYellow(value[0].e_mail);});});
    printdebug.printYellow(Utente.e_mail);
    
    setState(() {
      printdebug.printYellow("----------------------------------------------ciao sono dentro la funzione che sposta il container");
      //alignmentOfContainer=Alignment.centerLeft;
      //positionOfTendina=EdgeInsets.only(left: 200);
      if(tendinaIsOut){
        positionOfTendina= const EdgeInsets.only(left: 200);
        tendinaIsOut=false;
      }
      else{
        positionOfTendina=const EdgeInsets.only(left: 500);
        tendinaIsOut=true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    printdebug.printYellow("--------------");
    print(serverDataHandler.ipAddress);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(children: [
        
        HomeGames(),
        
        AnimatedContainer(
          child: Container(
            height: 500,
            width: 300,
            
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                      color: Color.fromARGB(255, 246, 177, 190)),
            child: LatBar(this),
          ),
          duration: const Duration(milliseconds: 250),
          padding: positionOfTendina,
          //color: Colors.cyanAccent,
          height: 700,
          alignment: const Alignment(-1,0),
          //color: Colors.black38,

        ),
        Container(
          child: Align(alignment: Alignment.topRight,
                        child: IconButton(
                              
                              onPressed: () {optionContainerMove();},
                              icon: const Icon(Icons.menu_rounded, size:50) ,
                              color: const Color.fromARGB(255, 231,83,107)
                               
                //fit: BoxFit.fitWidth,
                            ),
                        ),
              //color: Colors.blueAccent,
              padding: const EdgeInsets.only(top: 30),
        )
        
      ],),
      
      
      
      
      /*Container(
        child: Align( alignment: Alignment.centerRight,
                      child: Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: Colors.grey), backgroundColor: Colors.black, minimumSize: Size(50, 75), shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                              onPressed: () {print("ciao");optionContainerMove();},
                              child: Icon(Icons.clear_rounded, size:40)
                               
                //fit: BoxFit.fitWidth,
                ),

                          alignment: Alignment.centerRight,
          //decoration: BoxDecoration(shape: BoxShape.rectangle),
          //color: Colors.amber,
                          width: 200,
                          height: 100,
                          //duration: Duration(seconds: 3),
                          color: Colors.blue

                        ),
                      ),
        

        
        //padding:EdgeInsets.only(left: 300.0, top: 40),
        //alignment: Alignment.topRight,
        //color: Colors.amber,
        width: double.infinity,
        height: 150.0,
        color: Colors.orange
        

      ,) 
         */
      /*mettere all'interno un modo per visualizzare una lista verticale a coppie dei giochi*/
       /*Container(
   decoration : BoxDecoration(color : Colors.green),
   width: 200.0,
   height: 200.0,
   child: Center(
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
                      shape: BoxShape.circle,
                       color: Colors.red
                    ),
            ),
        )
)*/
    );
  }
  
}
class LatBar extends StatelessWidget{
  late _MyHomeAppState page;
  LatBar(this.page);

  @override
  Widget build(BuildContext context){
    if(Utente.hasMadeLogin){
      print('------------------------------${Utente.hasMadeLogin}');//questa parte é per la bar con il profilo loggato, quindi quando non si ha ancora fatto il login
      
        return Wrap(children: [
              const SizedBox(height: 100,
                    width: 1000),
              Container(
                child: TextButton(child: const Text("Profile", style: TextStyle(color: Color.fromARGB(255, 33, 33, 33), fontSize: 20)), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){return const libraryPageState();}));},),
                  decoration: const BoxDecoration(color: Color.fromARGB(0, 244, 67, 54)),
                  //padding: EdgeInsets.only(top:100),
                  alignment: Alignment.centerLeft,
                  height: 41,
                  width: 100,
              ),
              const SizedBox(
                height: 100,
                width: 1000,
              ),
              Container(
                  decoration: const BoxDecoration(color: Color.fromARGB(0, 244, 67, 54)),
                  //padding: EdgeInsets.only(top:100),
                  alignment: Alignment.centerLeft,
                  height: 41,
                  width: 100,
                  child: TextButton(child: const Text("Cerca", style: TextStyle(color: Colors.black, fontSize: 20)), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){return const SearchPageState();}));},),

              )
            ]) ;
            
            
    }
    else{
      print('------------------------------${Utente.hasMadeLogin}');//questa parte é per la bar con il profilo sloggato, quindi quando non si ha ancora fatto il login
           return Wrap(children: [
              const SizedBox(height: 100,
                    width: 1000),
              Container(
                child: TextButton(child: const Text("Login", style: TextStyle(color: Colors.black, fontSize: 20)), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){return const LoginApp();})).then((value) => page.updateAfterLogged());},),
                  decoration: const BoxDecoration(color: Color.fromARGB(0, 244, 67, 54)),
                  //padding: EdgeInsets.only(top:100),
                  alignment: Alignment.centerLeft,
                  height: 41,
                  width: 75,
              ),
              const SizedBox(
                height: 100,
                width: 1000,
              ),
              Container(
                  child: TextButton(child: const Text("Register", style: TextStyle(color: Color.fromARGB(255, 8, 8, 8), fontSize: 20)), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){return const RegisterApp();})).then((value) => page.updateAfterLogged());},),
                  decoration: const BoxDecoration(color: Color.fromARGB(0, 244, 67, 54)),
                  //padding: EdgeInsets.only(top:100),
                  alignment: Alignment.centerLeft,
                  height: 41,
                  width: 100,
              )
            ]) ;  
            }
    
  }
  
}
class HomeGames extends StatefulWidget{
  const HomeGames({super.key});
  @override
  State<HomeGames> createState() => _HomeGamesState.initState();
}
class _HomeGamesState extends State<HomeGames>{
  final int nRowMax=10;
  
  List <HomeRow> listagames=[];
  late List<Game>? listaprovvisoria;// che riempriò con la fecth
  //Color colorstartforvisualizeContainer= Color(1);
   _HomeGamesState.initState(){//creazione delle row
      //fetchingGames();
      
        
      
  }
  fetchingGames(){
    print("--------------------------------------------------------------------------");
    printdebug.printYellow(serverDataHandler.ipAddress);
    Future(()async{
         /*qua dentro chiamo la fetch*/  
        listagames=[];
        listaprovvisoria = await serverDataHandler.fetchGames();
        printdebug.printYellow(listaprovvisoria.toString());
        if(listaprovvisoria != null){
          int j=0;
          for(int i=0; i<nRowMax && i<(listaprovvisoria!.length)/2 ;i++){
            //print('so riva');
            listagames.add(HomeRow.initializeRow());//.settingInformationofRow(listaprovvisoria![j], listaprovvisoria![j+1]));
            listagames[i].settingInformationofRow(listaprovvisoria![j], listaprovvisoria![j+1]);
            j+=2;
          }
        }
        setState(() {
          
        });
      
      });
  }
  AssetImage getLogo(){
    return const AssetImage('src/Svegliati.png');
  }
  @override
  Widget build(BuildContext context){
    //this.initState();
    if(listagames.isEmpty){
      printdebug.printYellow("---------------------------non so quante volte vengo eseguito");
      fetchingGames();
    }
    
    return SizedBox(
          //color: Colors.blueAccent,
          //alignment: Alignment.bottomCenter,
          child: Stack(children: [
            
            SizedBox(
              child: RefreshIndicator(
                
                onRefresh: () {
                  
                  //print('stocazzo');
                  fetchingGames();
                  return Future(() => null);
                },
                child: ListView.builder(
            
            
            itemCount: listagames.length,

            itemBuilder: (context, index){
              if(index==0){
                return Column(
                  children: [
                    const SizedBox(
                      height: 200,
                      
                      width: 1,
                       
                    ),
                    Column(
                
                                children: [
                                  //oggetto che compone la riga del gioco, con in input il gioco che arriva dalla fetch
                                  listagames[index]
                                ],
                          ),
                  ],
                );
              }
              else{
                return Column(
                
                    children: [
                      //oggetto che compone la riga del gioco, con in input il gioco che arriva dalla fetch
                      listagames[index]
                    ],
              );
          
  }}),

              ),
  height: 800, //690
  width: 450, //450
  //color: Colors.lightBlueAccent,

            ),
            SizedBox(
                  //color: Colors.amber,
                  height: 220,
                  width: 400,
                  child: Align(alignment: Alignment.bottomCenter,
                  child: Image(image: getLogo(), width: 325,))
                  //color: Colors.blueGrey,
                ),

          ],
          ),
        height: 900,
        width: 450, //450
        //color: Colors.grey,
        
        );
  }
}

            
            
class HomeRow extends StatelessWidget{




  final double gameX=150; // ---------lunghezza del container che contiene il gioco, 200
  final double gameY=250; // ---------altezza del container che contiene il gioco


  final double imageX=150; // ---------lunghezza del container che contiene l'immagine
  final double imageY=150; // ---------altezza del container che contiene l'immagine

  final double gameNameX=250; //-------lunghezza del container che contiene il nome del gioco
  final double gameNameY=40; //--------altezza del  container che contiene il nome del gioco

  final double pricenameY=60; //altezza del container che contiene il prezzo del gioco
  final double pricenameX=125; //lunghezza del container che contiene il prezzo del gioco





  late Game game1;
  late Game game2;

  //richiesta in parametro: nome gioco, prezzo, immagine; per anteprima
  //String gameName1="";
  //String prezzo1="";
  //late Image image1;
  //String gameName2="";
  //String prezzo2="";
  //late Image image2;
  //Color colorstartforvisualizeContainer1= Color.fromARGB(0, 76, 66, 66);
  //Color colorstartforvisualizeContainer2= Color.fromARGB(0, 0, 0, 0);
  
  
  //HomeRow.initializeRow(this.gameName1, this.prezzo1, this.image1, this.gameName2, this.prezzo2, this.image2);
  HomeRow.initializeRow();
  HomeRow settingInformationofRow(Game game1, Game game2){
      //gameName1=s1;
      //gameName2=s2
      this.game1=game1;
      this.game2=game2;
      
      //game1 = Game.init();
      

      return this;
  }
  Image checkImageNotNull(bool isimage1){
    if(isimage1){
      if(game1.main_img != 'x'){
        return Image.network('http://${serverDataHandler.ipAddress}/www.R0G.com/sources/${game1.main_img}', fit: BoxFit.fitHeight,);

      }
      else{
        return Image.network('http://${serverDataHandler.ipAddress}/www.R0G.com/sources/image_not_available.jpg', fit: BoxFit.fitHeight,);
      }
    }
    else{
        if(game2.main_img != 'x'){
          return Image.network('http://${serverDataHandler.ipAddress}/www.R0G.com/sources/${game2.main_img}', fit: BoxFit.fitHeight);
        }
        else{
          return Image.network('http://${serverDataHandler.ipAddress}/www.R0G.com/sources/image_not_available.jpg', fit: BoxFit.fitHeight);
        }

    }
  }
  
  

  @override
  Widget build(BuildContext context){
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(child:Container(child:Column(
                                                        children: [
                                                            Container(
                                                              height: imageY,
                                                              width: imageX,
                                                              //Qua dentro ci dovrá essere l'immagine
                                                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Color.fromARGB(255, 158, 158, 158)),
                                                              child: checkImageNotNull(true)
                                                            ),//container che contiene l'immagine del gioco
                                                            
                                                            Container(child: Text(game1.nome!, style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 255, 255, 255)),),
                                                                        //color: const Color.fromARGB(255, 197, 130, 152),
                                                                        height: gameNameY,
                                                                        width: gameNameX,
                                                                        alignment: Alignment.bottomCenter,
                                                                        
                                                                      
                                                                      ),//nome del gioco,
                                                            Container(child: Text('${game1.prezzo!}€', style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255))),
                                                                        //color: Color.fromARGB(255, 62, 151, 57),
                                                                        height: pricenameY,
                                                                        width: pricenameX,
                                                                        alignment: Alignment.centerRight,


                                                                        
                                                                        )// inserire il prezzo
                                                        ],
                                                      ),
                                                  height: gameY,
                                                  width: gameX,
                                                  //color: Colors.cyanAccent,

                                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){return GamePage.init(this.game1, checkImageNotNull(true));}))/*.then((value) => page.updateAfterLogged())*/;
                                },
                                ),
                GestureDetector(child:Container(child:Column(
                                                        children: [
                                                            Container(
                                                              height: imageY,
                                                              width: imageX,
                                                              //color: Colors.lightGreenAccent,
                                                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Color.fromARGB(255, 158, 158, 158)),
                                                              //Qua dentro ci dovrá essere l'immagine
                                                              child: checkImageNotNull(false)
                                                            
                                                            ),//container che contiene l'immagine del gioco
                                                            
                                                            Container(child: Text(game2.nome!, style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),),
                                                                        //color: const Color.fromARGB(255, 197, 130, 152),
                                                                        height: gameNameY,
                                                                        width: gameNameX,
                                                                        alignment: Alignment.bottomCenter,
                                                                        
                                                                      
                                                                      ),//nome del gioco,
                                                            Container(child: Text('${game2.prezzo!}€', style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255))),
                                                                        //color: Color.fromARGB(255, 62, 151, 57),
                                                                        height: pricenameY,
                                                                        width: pricenameX,
                                                                        alignment: Alignment.centerRight,
                                                                        


                                                                        
                                                                        )// inserire il prezzo
                                                        ],
                                                      ),
                                                  height: gameY,
                                                  width: gameX,
                                                  //color: Colors.cyanAccent,
                                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){return GamePage.init(this.game2, checkImageNotNull(false));}))/*.then((value) => page.updateAfterLogged())*/;
                                })
              ],
            );
  }
}
