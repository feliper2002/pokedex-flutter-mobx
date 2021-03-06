import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_flutter_mobx/models/pokeApiHoenn.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/PokeItem/pokeItem.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/appBar.dart';
import 'package:pokedex_flutter_mobx/pages/widgets/darkPokeball.dart';
import 'package:pokedex_flutter_mobx/splash/fetchAll.dart';

class Hoenn extends StatefulWidget {
  @override
  _HoennState createState() => _HoennState();
}

class _HoennState extends State<Hoenn> {
  int _currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  List<PokeAPIHoenn> hoenndex = [];
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
                        name: 'PokeAPIHoenn',
                        builder: (_) {
                          List<PokeAPIHoenn> _hoennAPI = [];
                          _hoennAPI = hoennApiStore.apiHoenn;
                          hoenndex = _hoennAPI;
                          return (_hoennAPI != null)
                              ? PageView.builder(
                                  controller: _pageController,
                                  itemCount: _hoennAPI.length,
                                  itemBuilder: (_, index) {
                                    bool actualPage = (index == _currentPage);
                                    int id = _hoennAPI[index].dexNr;
                                    String numero = id.toString();
                                    return PokeItem(
                                      nome: _hoennAPI[index].names.english,
                                      image: hoennApiStore.getImage(
                                        numero: numero,
                                      ),
                                      activePage: actualPage,
                                      color: hoennApiStore.corPokemon,
                                      pokeNum: numero,
                                      types: listTypes(index),
                                      stats: {
                                        'atk': _hoennAPI[index].stats?.attack,
                                        'def': _hoennAPI[index].stats?.defense,
                                        'sta': _hoennAPI[index].stats?.stamina,
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
    types.add(hoenndex[index].primaryType.names.english);
    hoenndex[index].secondaryType != null
        ? types.add(hoenndex[index].secondaryType.names.english)
        : '';
    return types;
  }
}
