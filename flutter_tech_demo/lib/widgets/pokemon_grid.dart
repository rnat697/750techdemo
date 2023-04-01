
import 'package:flutter/material.dart';
import '../data/pokemon_repository.dart';
import 'poke_card.dart';
import '../utils/styles.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({super.key, required this.pokemonList});

  final List<PokemonRepository>? pokemonList;

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
      children: widget.pokemonList!.map((e)=> 
       Container(
          decoration: Styles.cardBoxStyle,
          alignment: Alignment.center,
          child: PokemonCard(pokeID:e.id, pokeName: e.name, spriteImg: e.spriteImg),
        
        )).toList(),

    );
  }
}