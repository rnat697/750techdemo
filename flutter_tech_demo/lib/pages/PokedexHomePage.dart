import 'package:flutter/material.dart';
import '../widgets/PokemonGrid.dart';
import 'package:http/http.dart' as http;
import '../data/PokemonRepository.dart';
import 'dart:convert';
class PokedexHomePage extends StatefulWidget {
  PokedexHomePage({super.key, required this.title});
  final title;
 
  @override
  State<PokedexHomePage> createState() => _PokedexHomeState();
}

class _PokedexHomeState extends State<PokedexHomePage> {
  late Future<List<PokemonRepository>> futurePokeList;
  @override
  void initState() {
    super.initState();
    futurePokeList = fetchPokemonRepo();
  }

  Future<List<PokemonRepository>> fetchPokemonRepo() async{
    // Fetching pokemon in blulk has been modifed from:  https://medium.com/@omlondhe/creating-a-flutter-pokedex-23c167cae043
    var poke;
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=1000&offset=0'));
    if(response.statusCode == 200){
        List<Map<String, dynamic>> data = List.from(jsonDecode(response.body)['results']);    
        setState(() {
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
   
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title), // To access class fields inside of a class state you use widget.
      ),
      body:FutureBuilder<List<PokemonRepository>>(
        future: futurePokeList,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return PokemonGrid(pokemonList: snapshot.data);
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
