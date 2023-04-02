import 'package:flutter/material.dart';
import '../widgets/pokemon_grid.dart';
import 'package:http/http.dart' as http;
import '../data/pokemon_repository.dart';
import 'dart:convert';
class PokedexHomePage extends StatefulWidget {
  const PokedexHomePage({super.key, required this.title});
  final String title;
 
  @override
  State<PokedexHomePage> createState() => _PokedexHomeState(); // classes, variables or methods with an underscore (_) at the beginning can only be accessible in the .dart file they are defined on
}

class _PokedexHomeState extends State<PokedexHomePage> {
  late Future<List<PokemonRepository>> futurePokeList;
  @override
  void initState() {
    super.initState();
    futurePokeList = _fetchPokemonRepo(); 
  }

  // This fetches pokemon in bulk from the pokeAPI which returns a Future List of pokemons. Futures are the result of asyncronous computation.
  Future<List<PokemonRepository>> _fetchPokemonRepo() async{
    // Fetching pokemon in blulk has been modifed from:  https://medium.com/@omlondhe/creating-a-flutter-pokedex-23c167cae043
    var poke;
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1000&offset=0'));
    if(response.statusCode == 200){
        List<Map<String, dynamic>> data = List.from(jsonDecode(response.body)['results']); 
        // For every pokemon in the response (since its in bulk) map it out to a PokemonRepository class which stores the basic data needed to show all
        //1,000 pokemon in a grid.   
        setState(() { // everytime you want to change the state you need to use the setState function
            poke = data.asMap().entries.map<PokemonRepository>((element) {
            element.value['id'] = element.key +1;
            element.value['img'] = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
            return PokemonRepository.fromJson(element.value);
          }).toList();
        });    
      }else{
        throw Exception('Failed to load Pokemon repository');
      }
    return poke;
  }

  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold( // This implements the basic material design layout structure
      appBar: AppBar(
        title: Text(widget.title), // To access class fields inside of a class state you use widget.
        ),
      body:FutureBuilder<List<PokemonRepository>>( // Future builder allows us to display the async data on the screen when it has finished fetching
        future: futurePokeList,
        builder: (context,snapshot){
          if(snapshot.hasData){ // only returns true if snapshot has non-nullable data
            return PokemonGrid(pokemonList: snapshot.data); // render the grid of pokemon (i.e. page contents)
          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }else{
            return  const CircularProgressIndicator();
          }
                
        }
      ),
    );
  }
}
