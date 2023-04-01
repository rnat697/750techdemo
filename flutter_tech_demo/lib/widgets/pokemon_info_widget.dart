import 'package:flutter/material.dart';
import '../data/pokemon_info.dart';
import '../utils/styles.dart';

class PokemonInfoWidget extends StatelessWidget {
 const PokemonInfoWidget({super.key, required this.pokemon});
  final PokemonInfo? pokemon;

  // Creating pokemon's type(s) widget 
  // Consindering that some pokemon can have more than 1 type (2 at most), we need to dynamically create type widgets
  // based on how many typings a pokemon would have.
  List<Widget> generateTypeWidgets(){
    List<Widget> typesWidgets = [Container(), Container()];
    Widget typeContainer;
    Color currentColour;
    int index = 0; 

    for(String type in pokemon!.types){
      // Get the current type colour which is associated by the current index
      currentColour = pokemon!.typeColours[index];

      typeContainer =  Container(
        decoration: BoxDecoration(
          color: currentColour,
          borderRadius: BorderRadius.circular(5)
        ),

        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(6),

        child: Text("${type[0].toUpperCase()}${type.substring(1)}",
          style: const TextStyle(fontSize: 16,
            color: Colors.white
          ),
        ),
      );

      // Add type widget that was created to the list
      typesWidgets[index] = typeContainer;
      index++;
    }
    return typesWidgets;
  }

  @override
  Widget build(BuildContext context){

    return SingleChildScrollView( // Allows any widgets under this to be scrollable
      child: Column( // page content is made in columns
        children: [
          // ---------- Image of Pokemon Widget ---------
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
              color: pokemon?.typeColours[0].withOpacity(0.4),
            ),
            child:Image.network(pokemon!.spriteImg, fit: BoxFit.fitHeight,),
          ),

          // -------- Name of Pokemon Widget ---------
          Text(
              "${pokemon!.name[0].toUpperCase()}${pokemon!.name.substring(1)}",
              style: Styles.pokeNameInfoText,
          ),

          // -------- Pokemon's types widget ---------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateTypeWidgets() ,
          ),
          
          // ------------ Height and Weight Widgets --------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child:  Column(
                  children: [
                    Text('${pokemon!.height.toString()} m', style: Styles.heightAndWeightText,),
                    const Text('Height', style: Styles.descriptionTextStyle),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text('${pokemon!.weight.toString()} kg', style: Styles.heightAndWeightText),
                    const Text('Weight', style: Styles.descriptionTextStyle,),
                  ],
                ),
              ),
            ],
          ),

          // ----------- Description widget -----------
          Center(
          child:Container(
            // Set a padding of 50 horizontally when on screen widths bigger than 500, otherwise set a padding of 25 horizontally
            padding: MediaQuery.of(context).size.width > 500 ? 
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10) : const EdgeInsets.symmetric(horizontal: 25, vertical: 10) ,
              child:Text(
                pokemon!.description,
                textAlign: TextAlign.left,
                style: Styles.descriptionTextStyle,
              ),
            ),
          ),

        ],
      ),
    );
  }
}