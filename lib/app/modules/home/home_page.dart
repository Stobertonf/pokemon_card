import 'home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/detail_page.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              onTap: () => abrirTelaDetalhar(
                context,
                pokemon,
              ),
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

  abrirTelaDetalhar(BuildContext context, Pokemon pokemon) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return PageDetail(
            pokemon: pokemon,
            key: ValueKey(pokemon.name),
          );
        },
      ),
    );
  }
}
