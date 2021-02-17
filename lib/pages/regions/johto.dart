import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_flutter_mobx/models/pokeApiJohto.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/PokeItem/pokeItem.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/appBar.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/darkPokeball.dart';
import 'package:pokedex_flutter_mobx/splash/fetchAll.dart';

class Johto extends StatefulWidget {
  @override
  _JohtoState createState() => _JohtoState();
}

class _JohtoState extends State<Johto> {
  int _currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  List<PokeAPIJohto> johtodex = [];

  @override
  void initState() {
    super.initState();
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
                          List<PokeAPIJohto> _johtoAPI = [];
                          _johtoAPI = johtoApiStore.apiJohto;
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
                                      image: johtoApiStore.getImage(
                                        numero: numero,
                                      ),
                                      activePage: actualPage,
                                      color: johtoApiStore.corPokemon,
                                      pokeNum: numero,
                                      types: listTypes(index),
                                      stats: {
                                        'atk': _johtoAPI[index].stats?.attack,
                                        'def': _johtoAPI[index].stats?.defense,
                                        'sta': _johtoAPI[index].stats?.stamina,
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
    types.add(johtodex[index].primaryType.names.english);
    johtodex[index].secondaryType != null
        ? types.add(johtodex[index].secondaryType.names.english)
        : '';
    return types;
  }
}
