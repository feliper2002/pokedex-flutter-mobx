import 'package:flutter/material.dart';
import 'package:pokedex_flutter_mobx/pages/pokedex.dart';
import 'package:pokedex_flutter_mobx/styles/themeScheme.dart';

void main() => runApp(InitApp());

class InitApp extends StatelessWidget {
  const InitApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      initialRoute: '/pokedex',
      theme: themeScheme(),
      routes: {
        '/pokedex': (context) => Pokedex(),
      },
    );
  }
}

/*

ROUTES:
  /splash         SplashScreen
 /pokedex   Main Page
 /pokemodel

*/
