import 'package:flutter/material.dart';
import 'pages/pokedex_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = "Tech Demo - Flutter Pokedex";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const PokedexHomePage(title: 'Pokedex'), // sets the default route of the app 
      // NOTE: that named routes are not recommended for most applications, see https://docs.flutter.dev/development/ui/navigation#limitations
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

