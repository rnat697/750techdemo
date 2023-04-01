import 'package:flutter/material.dart';
import 'package:flutter_tech_demo/data/pokemon_info.dart';
import 'package:flutter_tech_demo/widgets/pokemon_info_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonInfoPage extends StatefulWidget {
 PokemonInfoPage({super.key, required this.id,required this.name});
  final int id;
  final String name;
 
  @override
  State<PokemonInfoPage> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfoPage> {
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
        title: Text("${widget.name[0].toUpperCase()}${widget.name.substring(1)}"),
        
      ),
      body: FutureBuilder<PokemonInfo>(
        future: futurePokeList,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return PokemonInfoWidget(pokemon: snapshot.data);
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
