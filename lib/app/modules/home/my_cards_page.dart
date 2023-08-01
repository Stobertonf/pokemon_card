import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/detail_page.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_card/app/modules/home/home_controller.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({Key? key}) : super(key: key);

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  final HomeController controller = Modular.get<HomeController>();
  @override
  void initState() {
    controller.atualizarPokemonsObtidos();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => GridView.count(
          childAspectRatio: 0.72,
          crossAxisCount: 2,
          children: List.generate(
            controller.getPokemonsObtidos().length,
            (index) {
              var pokemon = controller.getPokemonsObtidos()[index];
              return GestureDetector(
                onTap: () => abrirTelaDetalhar(pokemon),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Hero(
                    tag: pokemon.uniqueId,
                    child: Image.network(pokemon.imageUrl),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  abrirTelaDetalhar(Pokemon pokemon) {
    Navigator.of(context as BuildContext).push(
      PageRouteBuilder(
        pageBuilder: (
          context,
          animation,
          secondaryAnimation,
        ) {
          return PageDetail(
            pokemon: pokemon,
            key: ValueKey(pokemon.name),
          );
        },
      ),
    );
  }
}
