
import 'package:flutter/material.dart';
import 'Pokemon.dart';
import 'PokeCard.dart';
import 'Styles.dart';

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
        decoration: Styles.cardBoxStyle,
        alignment: Alignment.center,
        child: PokemonCard(pokeName: e.name, spriteImg: e.spriteImg),
        
      )).toList(),

    );
  }
}