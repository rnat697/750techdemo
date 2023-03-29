
import 'package:flutter/material.dart';
import 'Pokemon.dart';

class PokemonGrid extends StatefulWidget {
  PokemonGrid({super.key, required this.pokemonList});

  final List<Pokemon>? pokemonList;

  @override
  State<PokemonGrid> createState() => _PokemonGridState();

}

class _PokemonGridState extends State<PokemonGrid>{

  @override
  Widget build(BuildContext context){

    return GridView(
            padding: const EdgeInsets.all(25),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: widget.pokemonList!.map((e)=> Container(
            color: Colors.red[200],
            alignment: Alignment.center,
            child: Text(e.name),
            //Image.network(e.spriteImg), // TODO:  https://stackoverflow.com/questions/70015558/flutter-card-with-gridview
              
          )).toList(),

          );
  }
}