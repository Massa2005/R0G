import 'package:flutter/material.dart';
import 'package:realmofgames/consoleDebug.dart';
import 'package:realmofgames/database/models.dart';
import 'package:realmofgames/home.dart';
import 'game.dart';
import 'serverDataHandler.dart';
import 'gamePage.dart';
class libraryPageState extends StatefulWidget{
  const libraryPageState({super.key});
  @override
  State<libraryPageState> createState() => LibraryPage.initState();

  
}
class LibraryPage extends State<libraryPageState>{
  
  LibraryPage.initState(){
    fetchingGamesFromDatabase();
  }
  late List<Game> listagiochiAcquistati;
  double searchTextfieldX=150;
  double searchTextFieldY=25;
  int opacityofcolor=0;
  bool showCursor=false;
  double fontsize=10;
  List<libraryPageRow> listGames=[];

  void fetchingGamesFromDatabase(){
    printdebug.printYellow('------------------- sono dentro libraryPage');
    listGames=[];
    getDao().then((value){value.getPost().then((value){
      if(value.isEmpty){

      }
      else{
        for(int i=0; i<value.length;i++){
          print(value[i].nome);
        Game game=Game(id: value[i].id, nome: value[i].nome,descrizione: value[i].descrizione, prezzo: value[i].prezzo, sconto: value[i].sconto, mail_editore: value[i].mail_editore, main_img: value[i].main_img, valutazione: value[i].valutazione, data_pubblicazione: value[i].data_pubblicazione );
        //listagiochiAcquistati.add(game);
        listGames.add(libraryPageRow());
        listGames[i].settingInformation(game, this);
      }
      }
      setState(() {
        
      });
      
    });});
  }
  void deletingGame(libraryPageRow l){
    listGames.remove(l);
    setState(() {
      
    });

  }
  @override
  Widget build (BuildContext context){
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
    
      body: Stack(children: [
        
        SizedBox(//container che contiene la ListView dei giochi
          height: 1000,
          width: 500,
          //color: const Color.fromARGB(255, 62, 98, 63),
          child: ListView.builder(
            
            itemCount: listGames.length,
            itemBuilder: (context, index){
              if(index==0){
                return Column(
                  children: [
                    const SizedBox(
                      height: 150,
                      
                      width: 500,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                        'Library',
                        style: TextStyle(color: Color.fromARGB(255, 231,83,107), fontSize: 50),
                      ),
                      )
                       
                    ),
                    Column(
                
                                children: [
                                  //oggetto che compone la riga del gioco, con in input il gioco che arriva dalla fetch
                                  listGames[index]
                                ],
                          ),
                  ],
                );
              }
              else{
                return Column(
                
                    children: [
                      //oggetto che compone la riga del gioco, con in input il gioco che arriva dalla fetch
                      listGames[index]
                    ],
              );
              }
              

          }),
        ),
        
        
      ],),
    );
  }
}
class libraryPageRow extends StatelessWidget{
  late Game game;
  late LibraryPage page;
  libraryPageRow settingInformation(Game game, LibraryPage page){
    this.page=page;


        this.game=game;
        return this;
  }
  Image checkImageNotNull(){
    
      if(game.main_img != 'x'){
        return Image.network('http://${serverDataHandler.ipAddress}/www.R0G.com/sources/${game.main_img}', fit: BoxFit.fitHeight,);

      }
      else{
        return Image.network('http://${serverDataHandler.ipAddress}/www.R0G.com/sources/image_not_available.jpg', fit: BoxFit.fitHeight,);
      
    }
    
    }
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        print("ciaoo");
        Navigator.push(context, MaterialPageRoute(builder: (context){return GamePage.init(game, checkImageNotNull());}));
      },
      child: SizedBox(
      
        //color: Colors.indigoAccent,
        //alignment: Alignment.center,
        height: 150,
        width: 500,
        child: Stack(children: [
            Align(

              alignment:const Alignment(-0.9, 0),
              child: Container(
                  color: const Color.fromARGB(255, 63, 87, 75),
                  height: 120,
                  width: 120,
                  child: checkImageNotNull(),
                ),
               
              ),
              Align(
                alignment: const Alignment(0.60, -0.65),
                child: Text(
                  '${game.nome}',
                    style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                ),
              ),
              Align(
                alignment: const Alignment(0.60, 0.25),
                child: Text('${game.prezzo}', style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),),
                
              ),
              Align(
                alignment: const Alignment(1, 1),
                child: IconButton(onPressed: ()async{
                                      //azione che comprerà il gioco
                                      //getDao().then((value) {value.insertGioco(Gioco(id: thisGame.id, nome: thisGame.nome!, descrizione: thisGame.descrizione!, prezzo: thisGame.prezzo!, sconto: thisGame.sconto!, mail_editore: thisGame.mail_editore!, main_img: thisGame.main_img!, valutazione: thisGame.valutazione!, data_pubblicazione: thisGame.data_pubblicazione!));});
                                      printdebug.printYellow("-------------------------------ho eliminato il gioco");
                                      Gioco gametodelete= Gioco(id: game.id, nome: game.nome!, descrizione: game.descrizione!, prezzo: game.prezzo!, sconto: game.sconto!, mail_editore: game.mail_editore!, main_img: game.main_img!, valutazione: game.valutazione!, data_pubblicazione: game.data_pubblicazione!);
                                      getDao().then((value){value.deleteGioco(gametodelete).then((value){
                                        page.deletingGame(this);
                                      });
                                      
                                      });
                                      


                                      
                                    }, icon: const Icon(Icons.delete_forever_rounded, size: 30,color:  Color.fromARGB(255, 231,83,107))),
              )
        ]),
    ),
    );
  }
}