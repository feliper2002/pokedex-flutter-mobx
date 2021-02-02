import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_flutter_mobx/models/pokeapi.dart';
import 'package:pokedex_flutter_mobx/pages/home/widgets/appBar.dart';
import 'package:pokedex_flutter_mobx/pages/home/widgets/darkPokeball.dart';
import 'package:pokedex_flutter_mobx/pages/home/widgets/pokeItem.dart';
import 'package:pokedex_flutter_mobx/stores/pokeapi_store.dart';

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  PokeApiStore pokeApiStore;

  int _currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokeAPI();
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            DarkPokeball(),
            Container(
              child: Column(
                children: [
                  PokeAppBar(),
                  Expanded(
                    child: Container(
                      child: Observer(
                        name: 'PokeAPI',
                        builder: (_) {
                          PokeAPI _pokeAPI = pokeApiStore.pokeAPI;

                          return (_pokeAPI != null)
                              ? PageView.builder(
                                  controller: _pageController,
                                  itemCount: _pokeAPI.pokemon.length,
                                  itemBuilder: (_, index) {
                                    Pokemon pokemon =
                                        pokeApiStore.getPokemon(index: index);
                                    bool actualPage = (index == _currentPage);
                                    return PokeItem(
                                      image: pokeApiStore.getImage(
                                          numero: pokemon.num),
                                      nome: pokemon.name,
                                      color: pokeApiStore.corPokemon,
                                      types: pokemon.type,
                                      index: pokemon.id,
                                      pokeNum: pokemon.num,
                                      activePage: actualPage,
                                    );
                                  },
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
