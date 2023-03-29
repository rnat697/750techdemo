import 'package:flutter/material.dart';
import 'package:flutter_tech_demo/data/PokemonInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokedexDetailsPage extends StatefulWidget {
  PokedexDetailsPage({super.key, required this.id,required this.name});
  final int id;
  final String name;
 
  @override
  State<PokedexDetailsPage> createState() => _PokedexDetailsState();
}

class _PokedexDetailsState extends State<PokedexDetailsPage> {
  late Future<PokemonInfo> futurePokeList;
  @override
  void initState() {
    super.initState();
    futurePokeList = fetchPokemonInfo();
  }

  Future<PokemonInfo> fetchPokemonInfo() async{
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.id}'));
    if(response.statusCode == 200){
      return PokemonInfo.fromJson(jsonDecode(response.body));
    }else{
        throw Exception('Failed to load Pokemon');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.name), // To access class fields inside of a class state you use widget.
      ),
      body: FutureBuilder<PokemonInfo>(
        future: futurePokeList,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data!.types.toString());
          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }else{
            return  const Center(child:CircularProgressIndicator());
          }
        }
      ),
    );
  }
}
