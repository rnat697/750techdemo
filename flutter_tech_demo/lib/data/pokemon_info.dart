// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utils/styles.dart';
class PokemonInfo{
  final int id;
  final String name;
  final String spriteImg;
  final List<String> types;
  final List<Color> typeColours;

  const PokemonInfo({
    required this.id,
    required this.name,
    required this.spriteImg,
    required this.types,
    this.typeColours = const [Colors.black, Colors.black],
  });

  factory PokemonInfo.fromJson(Map<String,dynamic>json){
    var sprites = json['sprites']['other']['official-artwork']; // to get sprite urls
    var arrayTypes = [''];

    // Check if there's only one typing'
    if(json['types'].length < 2){
      arrayTypes = [json['types'][0]['type']['name']];
    }else{
       arrayTypes = [json['types'][0]['type']['name'],json['types'][1]['type']['name']];
    }

    return PokemonInfo(
      name: json['name'] , 
      id: json['id'], 
      spriteImg: sprites['front_default'], 
      types: arrayTypes,
      typeColours: Styles.setTypeColour(arrayTypes),
      );
  }
  
}
