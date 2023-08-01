import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/home_module.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_card/app/modules/home/home_controller.dart';

class PageDetail extends StatefulWidget {
  final Pokemon pokemon;

  const PageDetail({
    required Key key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  bool exibirCardExpadindo = false;

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        centerTitle: true,
        actions: [
          const IconButton(
            icon: Icon(Icons.favorite),
            onPressed: null,
          ),
          IconButton(
            icon: const Icon(
              Icons.person_add,
            ),
            onPressed: () => adicionarListaObtidos(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => alterarExibicaoCard(),
              child: Visibility(
                visible: !exibirCardExpadindo,
                child: Hero(
                  tag: widget.pokemon.uniqueId,
                  child: Image.network(widget.pokemon.imageUrl),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => alterarExibicaoCard(),
              child: Visibility(
                visible: exibirCardExpadindo,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.network(widget.pokemon.imageUrlHiRes),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  alterarExibicaoCard() {
    setState(() {
      exibirCardExpadindo = !exibirCardExpadindo;
    });
  }

  adicionarListaObtidos() {
    controller.adicionarListaObtidos(widget.pokemon);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Adiciona na lista de obtidos."),
      ),
    );
  }
}
