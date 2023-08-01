// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_HomeControllerBase.pokemons', context: context);

  @override
  List<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$atualizarPokemonsObtidosAsyncAction = AsyncAction(
      '_HomeControllerBase.atualizarPokemonsObtidos',
      context: context);

  @override
  Future atualizarPokemonsObtidos() {
    return _$atualizarPokemonsObtidosAsyncAction
        .run(() => super.atualizarPokemonsObtidos());
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
