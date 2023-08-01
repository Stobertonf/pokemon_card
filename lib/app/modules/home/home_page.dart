import 'home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokemons = [];
    return Scaffold(
      body: GridView.count(
        childAspectRatio: 0.72,
        crossAxisCount: 2,
        children: List.generate(
          pokemons.length,
          (index) {
            var pokemon = pokemons[index];
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                ),
                child: Hero(
                  tag: pokemon.uniqueId,
                  child: Image.network(pokemon.imageUrl),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
