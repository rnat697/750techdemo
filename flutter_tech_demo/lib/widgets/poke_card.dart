
import 'package:flutter/material.dart';
import 'package:flutter_tech_demo/pages/pokemon_info_page.dart';
import '../utils/Styles.dart';
// This is a custom widget to show each pokemon in a card like style.
class PokemonCard extends StatelessWidget{
  const PokemonCard({super.key, required this.pokeID, required this.pokeName, required this.spriteImg});
  final int pokeID;
  final String pokeName;
  final String spriteImg;

  @override
  Widget build(BuildContext context){

    return GestureDetector( // We wrap the entire widget with a gesture detector to allow users to tap on a pokemon card to view the pokemon's detailed information.
      onTap: () => {
        Navigator.of(context).push( // This one way to navigate to pages / routes. Pushes the widget (page) on to the top of the navigation stack.
          MaterialPageRoute(
            builder: (context) => PokemonInfoPage(id: pokeID, name: pokeName),
          ),
        )
      },
      // ----------- Card layout -----------
      child: Column(
        children: [
          // -------- Image of Pokemon Widget ----------
          Expanded(
            child: Image.network(spriteImg, fit: BoxFit.fill),
          ),

          const Divider(thickness: 1.5),
          // ------ Name of pokemon widget --------
          Text(
            "${pokeName[0].toUpperCase()}${pokeName.substring(1)}",
            style: Styles.cardNamesStyle,
          )
        ],
      ),
    );
  }


}