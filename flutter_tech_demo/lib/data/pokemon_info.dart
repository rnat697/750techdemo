// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utils/styles.dart';
class PokemonInfo{
  final int id;
  final String name;
  final String spriteImg;
  final List<String> types;
  final List<Color> typeColours;
  final String description;
  final double weight;
  final double height;

  const PokemonInfo({
    required this.id,
    required this.name,
    required this.spriteImg,
    required this.types,
    this.typeColours = const [Colors.black, Colors.black],
    this.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a dolor quis tortor vestibulum sollicitudin non in urna. Donec fringilla arcu ut odio iaculis, eu hendrerit purus ullamcorper. Suspendisse faucibus posuere ipsum. Nullam at vulputate felis. Nam fringilla velit justo, tincidunt iaculis elit suscipit et. Suspendisse mollis fringilla urna porttitor sollicitudin. Duis vel diam non metus aliquam condimentum. Pellentesque ac suscipit nulla. Etiam laoreet lectus dolor, iaculis tempor neque sollicitudin eu. Donec ligula enim, laoreet vel laoreet a, efficitur ac velit. ",
    required this.weight,
    required this.height,
  });

  factory PokemonInfo.fromJson(Map<String,dynamic>json){
    var sprites = json['sprites']['other']['official-artwork']; // to get sprite urls
    var arrayTypes = [''];
    var weightInHectogram = json['weight'];
    var heightInDecimetre = json['height'];
    // Convert weight from hectogram to kilogram and height from decimetre to metre
    double weightInKg = weightInHectogram / 10; 
    double heightInmetre = heightInDecimetre/10;

    // Check if there's only one typing
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
      weight: weightInKg,
      height: heightInmetre,
      );
  }
  
}
