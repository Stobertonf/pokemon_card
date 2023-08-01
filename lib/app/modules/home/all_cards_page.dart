import 'all_cards_page.dart';
import 'home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/detail_page.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_card/app/modules/home/home_controller.dart';

class AllCardsPage extends StatefulWidget {
  const AllCardsPage({Key? key}) : super(key: key);

  @override
  _AllCardsPageState createState() => _AllCardsPageState();
}

class _AllCardsPageState extends State<AllCardsPage> {
  final HomeController controller = Modular.get<HomeController>();

  List<Pokemon> pokemons = [];

  @override
  void initState() {
    loadPokemons();
    super.initState();
  }

  void loadPokemons() async {
    var allPokemons = await controller.getAllPokemons();
    setState(() {
      pokemons = allPokemons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        childAspectRatio: 0.72,
        crossAxisCount: 2,
        children: List.generate(pokemons.length, (index) {
          var pokemon = pokemons[index];
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
        }),
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
