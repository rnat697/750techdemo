import 'package:flutter/material.dart';
import 'pages/pokedex_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = "Tech Demo - Flutter";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PokedexHomePage(title: 'Pokedex'),
    );
  }
}

