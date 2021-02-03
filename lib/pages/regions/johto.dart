import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_flutter_mobx/models/pokeApiJohto.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/PokeItem/pokeItem.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/appBar.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/darkPokeball.dart';
import 'package:pokedex_flutter_mobx/stores/pokeapi_store.dart';

class Johto extends StatefulWidget {
  @override
  _JohtoState createState() => _JohtoState();
}

class _JohtoState extends State<Johto> {
  PokeApiStore pokeApiStore;

  int _currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  List<PokeAPIJohto> johtodex = [];
  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    print('Tentando dar fetch na API de Johto...');
    pokeApiStore.fetchPokeAPIJohto();
    print('Ótimo!! Conseguimos dar o fetch!');
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
                        name: 'PokeAPIJohto',
                        builder: (_) {
                          List<PokeAPIJohto> _johtoAPI = pokeApiStore.apiJohto;
                          johtodex = _johtoAPI;
                          return (_johtoAPI != null)
                              ? PageView.builder(
                                  controller: _pageController,
                                  itemCount: _johtoAPI.length,
                                  itemBuilder: (_, index) {
                                    bool actualPage = (index == _currentPage);
                                    int id = _johtoAPI[index].dexNr;
                                    String numero = id.toString();
                                    return PokeItem(
                                      nome: _johtoAPI[index].names.english,
                                      image: pokeApiStore.getImage(
                                        numero: numero,
                                      ),
                                      activePage: actualPage,
                                      color: pokeApiStore.corPokemon,
                                      pokeNum: numero,
                                      types: listTypes(index),
                                      stats: {
                                        'atk': _johtoAPI[index].stats.attack,
                                        'def': _johtoAPI[index].stats.defense,
                                        'sta': _johtoAPI[index].stats.stamina,
                                      },
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

  List<String> listTypes(int index) {
    List<String> types = [];
    for (var i = 0; i < 1; i++) {
      types.add(johtodex[index].primaryType.names.english);
    }
    return types;
  }
}
