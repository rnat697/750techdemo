import 'package:flutter/material.dart';
// Pokemon type colours are taken from https://gist.github.com/apaleslimghost/0d25ec801ca4fc43317bcff298af43c3
abstract class Styles{
  static const Color normalType = Color(0xFFA8A77A);
  static const Color fireType = Color(0xFFEE8130);
  static const Color waterType = Color(0xFF6390F0);
  static const Color electricType = Color(0xFFF7D02C);
  static const Color grassType = Color(0xFF7AC74C);
  static const Color iceType = Color(0xFF96D9D6);
  static const Color fightingType = Color(0xFFC22E28);
  static const Color poisonType = Color(0xFFA33EA1);
  static const Color groundType = Color(0xFFE2BF65);
  static const Color flyingType = Color(0xFFA98FF3);
  static const Color psychicType = Color(0xFFF95587);
  static const Color bugType = Color(0xFFA6B91A);
  static const Color rockType = Color(0xFFB6A136);
  static const Color ghostType = Color(0xFF735797);
  static const Color dragonType = Color(0xFF6F35FC);
  static const Color darkType = Color(0xFF705746);
  static const Color steelType = Color(0xFFB7B7CE);
  static const Color fairyType = Color(0xFFD685AD);
  
  static const TextStyle cardNamesStyle = TextStyle(color: Colors.white, fontSize: 20);
  static BoxDecoration cardBoxStyle = BoxDecoration(color: Colors.red.shade200, borderRadius: BorderRadius.circular(5.0));

}