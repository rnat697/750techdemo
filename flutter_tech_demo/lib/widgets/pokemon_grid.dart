
import 'package:flutter/material.dart';
import '../data/pokemon_repository.dart';
import 'poke_card.dart';
import '../utils/styles.dart';

// This is a custom widget to show each pokemon from the list in a grid layout.
class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key, required this.pokemonList});

  final List<PokemonRepository>? pokemonList;

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
      children: pokemonList!.map((e)=>  // Map every pokemon in the list into a Pokemon Card Widget
       Container(
          decoration: Styles.cardBoxStyle,
          alignment: Alignment.center,
          child: PokemonCard(pokeID:e.id, pokeName: e.name, spriteImg: e.spriteImg),
        )).toList(),

    );
  }
}