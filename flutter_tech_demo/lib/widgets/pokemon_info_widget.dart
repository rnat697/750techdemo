import 'package:flutter/material.dart';
import '../data/pokemon_info.dart';

class PokemonInfoWidget extends StatefulWidget {
 const PokemonInfoWidget({super.key, required this.pokemon});
  final PokemonInfo? pokemon;
 
  @override
  State<PokemonInfoWidget> createState() => _PokemonInfoWidgetState();
}

class _PokemonInfoWidgetState extends State<PokemonInfoWidget> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> generateTypeWidgets(){
    List<Widget> typesWidgets = [Container(), Container()];
    Widget typeContainer;
    Color currentColour;
    int index = 0; 


    for(String type in widget.pokemon!.types){
      currentColour = widget.pokemon!.typeColours[index];
      typeContainer =  Container(
        decoration: BoxDecoration(
          color: currentColour,
          borderRadius: BorderRadius.circular(5)
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(6),
        child: Text("${type[0].toUpperCase()}${type.substring(1)}",
          style: const TextStyle(fontSize: 20,
            color: Colors.white
          ),
        ),
      );

      typesWidgets[index] = typeContainer;
      index++;
    }
    return typesWidgets;
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          color: widget.pokemon?.typeColours[0].withOpacity(0.4),
          child:Image.network(widget.pokemon!.spriteImg, fit: BoxFit.fitHeight,),
        ),
        Text(
            "${widget.pokemon!.name[0].toUpperCase()}${widget.pokemon!.name.substring(1)}",
            style: const TextStyle(fontSize: 28),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: generateTypeWidgets() ,
        )



      ],
    );
  }
}