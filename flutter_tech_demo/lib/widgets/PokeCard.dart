// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../utils/Styles.dart';

class PokemonCard extends StatelessWidget{
  PokemonCard({super.key, required this.pokeID, required this.pokeName, required this.spriteImg});
  final int pokeID;
  final String pokeName;
  final String spriteImg;

  @override
  Widget build(BuildContext context){

    return GestureDetector(
      onTap: () => {
        print("ew ${pokeID}")
      },
      child: Column(
        children: [
          Expanded(
            child: Image.network(spriteImg, fit: BoxFit.fill),
          ),
          const Divider(thickness: 1.5),
          Text(
            "${pokeName[0].toUpperCase()}${pokeName.substring(1)}",
            style: Styles.cardNamesStyle,
          )
        ],
      ),
    );
  }


}