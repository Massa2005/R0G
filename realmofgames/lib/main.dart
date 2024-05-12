import 'package:flutter/material.dart';
import 'package:realmofgames/home.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'ROG',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeApp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      //_counter++;
    });
  }
  void enterSecondPage(){
    //Navigator.push(context, MaterialPageRoute(builder: (context){return SecondPageHome(title: "ciao");}));
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
      title: Text(widget.title),
      ),
      body: const SizedBox(
        child: Text("ciao, questa é la tua prima pagina", style: TextStyle(fontSize: 30),),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: enterSecondPage,
        //tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}






