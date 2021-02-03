// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<List<PokeAPI>> _$apiKantoComputed;

  @override
  List<PokeAPI> get apiKanto =>
      (_$apiKantoComputed ??= Computed<List<PokeAPI>>(() => super.apiKanto,
              name: '_PokeApiStoreBase.apiKanto'))
          .value;
  Computed<List<PokeAPIJohto>> _$apiJohtoComputed;

  @override
  List<PokeAPIJohto> get apiJohto =>
      (_$apiJohtoComputed ??= Computed<List<PokeAPIJohto>>(() => super.apiJohto,
              name: '_PokeApiStoreBase.apiJohto'))
          .value;
  Computed<List<PokeAPIHoenn>> _$apiHoennComputed;

  @override
  List<PokeAPIHoenn> get apiHoenn =>
      (_$apiHoennComputed ??= Computed<List<PokeAPIHoenn>>(() => super.apiHoenn,
              name: '_PokeApiStoreBase.apiHoenn'))
          .value;

  final _$_apiKantoAtom = Atom(name: '_PokeApiStoreBase._apiKanto');

  @override
  List<PokeAPI> get _apiKanto {
    _$_apiKantoAtom.reportRead();
    return super._apiKanto;
  }

  @override
  set _apiKanto(List<PokeAPI> value) {
    _$_apiKantoAtom.reportWrite(value, super._apiKanto, () {
      super._apiKanto = value;
    });
  }

  final _$_apiJohtoAtom = Atom(name: '_PokeApiStoreBase._apiJohto');

  @override
  List<PokeAPIJohto> get _apiJohto {
    _$_apiJohtoAtom.reportRead();
    return super._apiJohto;
  }

  @override
  set _apiJohto(List<PokeAPIJohto> value) {
    _$_apiJohtoAtom.reportWrite(value, super._apiJohto, () {
      super._apiJohto = value;
    });
  }

  final _$_apiHoennAtom = Atom(name: '_PokeApiStoreBase._apiHoenn');

  @override
  List<PokeAPIHoenn> get _apiHoenn {
    _$_apiHoennAtom.reportRead();
    return super._apiHoenn;
  }

  @override
  set _apiHoenn(List<PokeAPIHoenn> value) {
    _$_apiHoennAtom.reportWrite(value, super._apiHoenn, () {
      super._apiHoenn = value;
    });
  }

  final _$corPokemonAtom = Atom(name: '_PokeApiStoreBase.corPokemon');

  @override
  dynamic get corPokemon {
    _$corPokemonAtom.reportRead();
    return super.corPokemon;
  }

  @override
  set corPokemon(dynamic value) {
    _$corPokemonAtom.reportWrite(value, super.corPokemon, () {
      super.corPokemon = value;
    });
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokeAPIKanto() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokeAPIKanto');
    try {
      return super.fetchPokeAPIKanto();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokeAPIJohto() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokeAPIJohto');
    try {
      return super.fetchPokeAPIJohto();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchPokeAPIHoenn() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokeAPIHoenn');
    try {
      return super.fetchPokeAPIHoenn();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
corPokemon: ${corPokemon},
apiKanto: ${apiKanto},
apiJohto: ${apiJohto},
apiHoenn: ${apiHoenn}
    ''';
  }
}
