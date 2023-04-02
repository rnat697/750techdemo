import 'package:flutter/material.dart';
import 'package:flutter_tech_demo/data/pokemon_info.dart';
import 'package:flutter_tech_demo/widgets/pokemon_info_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonInfoPage extends StatefulWidget { // Stateful widgets hold an internal state depending on a user’s interaction, in which it can change appearance in response to that interaction.
 const PokemonInfoPage({super.key, required this.id,required this.name});
  final int id;
  final String name;
 
  @override
  State<PokemonInfoPage> createState() => _PokemonInfoState(); // variables or methods with an underscore (_) at the beginning can only be accessible in the .dart file they are defined on
}

class _PokemonInfoState extends State<PokemonInfoPage> { // Since it is Stateful, we need a class for the state of the widget (page/screen in this case)
  late Future<PokemonInfo> futurePokeInfo;
  @override
  void initState() {
    super.initState();
    futurePokeInfo = _fetchPokemonInfo();
  }

  // This method fetches a specific pokemon's detailed information from PokeAPI so we can show it on the pokemon info page.
  // Returns a Future that is of type PokemonInfo which is a class that contains the detailed information of that pokemon.
  Future<PokemonInfo> _fetchPokemonInfo() async{
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.id}'));
    if(response.statusCode == 200){
      return PokemonInfo.fromJson(jsonDecode(response.body));
    }else{
        throw Exception('Failed to load Pokemon');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(  // This implements the basic material design layout structure
      appBar: AppBar( // This automatically adds a back button when the widget (page) has been pushed on to the navigation stack
        title: Text("${widget.name[0].toUpperCase()}${widget.name.substring(1)}"),
        ),
      body: FutureBuilder<PokemonInfo>( // Future builder allows us to display the async data on the screen when it has finished fetching
        future: futurePokeInfo,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return PokemonInfoWidget(pokemon: snapshot.data); // render the info widget (i.e. page contents)
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
