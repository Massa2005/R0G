import 'package:flutter/material.dart';
import 'package:realmofgames/gamePage.dart';
import 'package:realmofgames/serverDataHandler.dart';
import 'game.dart';
import 'consoleDebug.dart';
class SearchPageState extends StatefulWidget{
  const SearchPageState({super.key});
  @override
  State<SearchPageState> createState() => SearchPage.initState();

  
}
//pagina dove si possono cercare i giochi, 
class SearchPage extends State<SearchPageState>{
  double searchTextfieldX=150;
  double searchTextFieldY=25;
  int opacityofcolor=0;
  bool showCursor=false;
  double fontsize=10;
  //Color colorofhint= const Color.fromARGB(255, 0, 0, 0);
  bool hadoneanimation=false;
  List<SearchPageRow> listGames=[];
  SearchPage.initState();
  late List<Game>? listgamefromfetch;
  Future<void> updateState(String textFieldValue)async{
      listgamefromfetch=await serverDataHandler.fetchGamesonSearch(textFieldValue);
      printdebug.printYellow(listgamefromfetch.toString());
      listGames=[];
      if(listgamefromfetch != null){
        printdebug.printYellow(listgamefromfetch!.length.toString());
        for(int i=0; i<listgamefromfetch!.length;i++){
          printdebug.printYellow('dentro il sostitutore alla ${i} volta');


          listGames.add(SearchPageRow());
          listGames[i].settingInformation(listgamefromfetch![i]);
        }
        setState(() {
          
        });
      }
  }
  void animationTextField() {

    setState(() {
    if(!hadoneanimation){

      print('dovrei essere false ${hadoneanimation}');
      searchTextFieldY+=40;
      searchTextfieldX+=60;
      //colorofhint=Colors.white;
      //Future.delayed(Duration(milliseconds: 200));
      fontsize=30;
      hadoneanimation=true;

      
      

      //return true;
      
    }
    else{
      print('dovrei essere true ${hadoneanimation}');

      searchTextFieldY-=40;
      searchTextfieldX-=60;
      //colorofhint=Colors.black;
      opacityofcolor=0;
      showCursor=false;
      fontsize=10;
      hadoneanimation=false;
      //return false;
    }
    //Future.delayed(const Duration(milliseconds: 200)).then((value){if(hadoneanimation){opacityofcolor=255;print(hadoneanimation);}});
    });

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 84, 79, 79),
    
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
                      
                      width: 1,
                       
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
        
        Column(children: [
          const Padding(padding: EdgeInsets.only(top: 75)),
          SizedBox(
          //padding: EdgeInsets.only(top: 300),
          //color: Colors.black54,
          height: 100,
          width: 500,
          child: Align(alignment: const Alignment(0,-1),
                        child: AnimatedContainer(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), color: Colors.black),
                          width: searchTextfieldX,
                          height: searchTextFieldY,
                          padding:const  EdgeInsets.only(left: 7.5),
                          //color: const Color.fromARGB(255, 0, 0, 0),
                          duration: const Duration(milliseconds: 250),
                          //onEnd: () => (){if(hadoneanimation){opacityofcolor=255;printdebug.printYellow(hadoneanimation as String);}},
                          
                          
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child:  TextField(
                              
                              cursorColor: const Color.fromARGB(255, 231,83,107),
                              showCursor: false,
                              style:  TextStyle(color: const Color.fromARGB(255, 231,83,107), fontSize: fontsize),
                              cursorHeight: 10,
                              
                            textAlign:TextAlign.left,
                            decoration:  InputDecoration(
                                
                                
                                hintText: 'cerca',
                                hintStyle: TextStyle(color: Color.fromARGB(opacityofcolor, 231,83,107), fontSize: 30),
                                border: InputBorder.none,
                                ),
                            onChanged: (value) {
                                        printdebug.printYellow(value);// qua chiamero la fetch dei giochi a ricerca... 
                                        updateState(value);
                                      },
                            onTap: (){if(!hadoneanimation){
                              animationTextField();
                                      Future.delayed(const Duration(milliseconds: 240)).then((value){if(hadoneanimation){setState(() {
                                        opacityofcolor=255;
                                        showCursor=true;
                                        print(hadoneanimation);
                                      });}});
                            }},
                            onTapOutside:(event) {
                              if(hadoneanimation){
                                animationTextField();
                              
                              }
                              //Future.delayed(const Duration(milliseconds: 200)).then((value){if(hadoneanimation){opacityofcolor=255;print(hadoneanimation);}});
                              
                            },
                                            
                                            
                                            
                                                  ),
                          )
                                            

                        )),
        ),
        ],)
      ],),
    );
  }
}
class SearchPageRow extends StatelessWidget{
  
  late Game game;
  SearchPageRow settingInformation(Game game){
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
                
              )
        ]),
    ),
    );
  }
}
