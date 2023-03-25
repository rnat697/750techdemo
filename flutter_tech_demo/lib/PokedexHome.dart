import 'package:flutter/material.dart';

class PokedexHome extends StatefulWidget {
  PokedexHome({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final title;
 
  @override
  State<PokedexHome> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PokedexHome> {
   final List numbers = List.generate(30, (index) => "Item $index");
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title),
      ),
      body:GridView(
            padding: const EdgeInsets.all(25),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: numbers.map((e)=> Container(
            color: Colors.red[200],
            alignment: Alignment.center,
            child:Text(e), // TODO:  https://stackoverflow.com/questions/70015558/flutter-card-with-gridview
              
          )).toList(),

          ),
      );
  }
}
