import 'package:flutter/material.dart';
import 'PokemonGrid.dart';
import 'package:http/http.dart' as http;
import 'Pokemon.dart';
import 'dart:convert';
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
  State<PokedexHome> createState() => _PokedexHomeState();
}

class _PokedexHomeState extends State<PokedexHome> {
  //late AsyncSnapshot<List<Pokemon>> pokeList;
  late Future<List<Pokemon>> futurePokeList;
  @override
  void initState() {
    super.initState();
    // numbers = List.generate(1000, (index) => "Item $index");
    futurePokeList = fetchPokemon();
  }

  Future<List<Pokemon>> fetchPokemon() async{
    // Fetching pokemon in blulk has been modifed from:  https://medium.com/@omlondhe/creating-a-flutter-pokedex-23c167cae043
    //List<Pokemon> listOfPokes = [];
    //Pokemon poke;
    var poke;
    ///for(int id = 1; id < 10; id++){
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1000'));
      print("---------------");
      if(response.statusCode == 200){
           List<Map<String, dynamic>> data = List.from(jsonDecode(response.body)['results']);

          //print(response.body);
          
          setState(() {
              poke = data.asMap().entries.map<Pokemon>((element) {
              element.value['id'] = element.key +1;
              element.value['img'] = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
              return Pokemon.fromJson(element.value);
            }).toList();
          });
          // poke = Pokemon.fromJson(jsonDecode(response.body));
          // poke.setTypeColour();
          // pokeList.add(Pokemon.fromJson(jsonDecode(response.body)));
       
      }else{
        throw Exception('Failed to load Pokemon');
      }
   // }
    return poke;
  }

  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title),
      ),
      body:FutureBuilder<List<Pokemon>>(
        future: futurePokeList,
        builder: (context,snapshot){
          if(snapshot.hasData){
            //pokeList = snapshot;
            return PokemonGrid(pokemonList: snapshot.data);
          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return  const CircularProgressIndicator();
                
        }
      ),
    );
  }
}
