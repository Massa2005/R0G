
import 'package:realmofgames/consoleDebug.dart';
import 'package:realmofgames/database/models.dart';
import 'package:realmofgames/game.dart';
import 'package:flutter/material.dart';               
import 'home.dart';
class GamePage extends StatelessWidget{
  Game thisGame;
  Image gameimage;
  Color colorofValutationContainer=const Color.fromARGB(255,255,255,255);
  GamePage.init(this.thisGame, this.gameimage);
  Color getColorofvalutationcontainer(){
    var test=double.parse(thisGame.valutazione!);
    if(test < 5){
        return colorofValutationContainer=const Color.fromARGB(255, 255, 0, 0);
    }
    else if(test >= 6){
      return colorofValutationContainer=const Color.fromARGB(255, 0, 255, 0);
    }
    else{
      return colorofValutationContainer=Color.fromARGB(255, 250, 134, 40);
    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:const  Color.fromARGB(255, 0, 0, 0),
      body: ListView(
        children: [
          SizedBox(
            //color:Colors.cyanAccent,
            height: 100,
            //width: 100,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(icon: const Icon(Icons.arrow_back_rounded, size: 40,color: Color.fromARGB(255, 231,83,107)), onPressed: (){Navigator.pop(context);},)
            )

          ),
          SizedBox(// immagine del gioco
            height: 300,
            width: 500,
            child: 
            Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: 300,
                width: 300,
                color: Colors.black38,
                child: gameimage,
              ),
            )
          ),
          SizedBox(//nome del gioco
            
            height: 110,
            width: 2,
            child:Align(
                      alignment:const  Alignment(-0.8, 1),
                      child: Text(thisGame.nome!, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 40))
                  
                  ),

            
          ),
          

          SizedBox(// box del prezzo stilizzato 
            height: 200,
            width: 1,
            child: Align(
              alignment: const Alignment(0, 0),
              child: Container(
                decoration:  BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 231,83,107),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(255, 47, 48, 46)
                              ),
                //color:const Color.fromARGB(255, 47, 48, 46),
                height: 100,
                width: 200,
                alignment: Alignment.center,
                child: Text('${thisGame.prezzo!}€', style: const TextStyle(color: Color.fromARGB(255, 231,83,107), fontSize: 55)),
              ),
            ),
          ),
          SizedBox(//bottone per comprare un gioco
              child: IconButton(onPressed: ()async{
                                      //azione che comprerà il gioco
                                      getDao().then((value) {value.insertGioco(Gioco(id: thisGame.id, nome: thisGame.nome!, descrizione: thisGame.descrizione!, prezzo: thisGame.prezzo!, sconto: thisGame.sconto!, mail_editore: thisGame.mail_editore!, main_img: thisGame.main_img!, valutazione: thisGame.valutazione!, data_pubblicazione: thisGame.data_pubblicazione!));});
                                      printdebug.printYellow("-------------------------------ho aggiunto il gioco");


                                      
                                    }, icon: const Icon(Icons.attach_money_rounded, size: 50,color:  Color.fromARGB(255, 231,83,107))),

          ),
          // qua in mezzo ci deve essere il bottone per comprare il gioco

          Container(//mail editore 
            height: 50,
            width: 1,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Sviluppato da: ${thisGame.mail_editore}', style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),
            ),
          ),

          Container( //descrizione del gioco
              
              constraints: const BoxConstraints(
              maxHeight: double.infinity,),
              width: 1,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 75),
              child: Align(
                alignment: Alignment.center,
                child: Text('${thisGame.descrizione}', style: const TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center),

              ),
            ),
          Container(
            
            //padding: const EdgeInsets.only(bottom: 100),
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: getColorofvalutationcontainer(),
                                  width: 10.0,
                                ),
                                //borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(255, 47, 48, 46)
                              ),
            child: Text("${thisGame.valutazione}", style: TextStyle(fontSize: 45, color: getColorofvalutationcontainer()), ),                  
          )
        ],
      )
    );
  }
}