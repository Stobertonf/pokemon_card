import 'package:dio/io.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';

@Injectable()
class PokemonRepository extends Disposable {
  static const OBTIDOS_KEY = "OBTIDOS_KEY";
  final DioForNative client;

  PokemonRepository(this.client);

  @override
  void dispose() {}

  adicionarListaObtidos(Pokemon pokemon) async {
    var shared = await SharedPreferences.getInstance();
    var pokemons = shared.getStringList(OBTIDOS_KEY);

    if (pokemons == null || pokemons.isEmpty) {
      shared.setStringList(OBTIDOS_KEY, [pokemon.toJson(CardType.MY_CARD)]);
    } else {
      pokemons.add(pokemon.toJson(CardType.MY_CARD));
      shared.setStringList(OBTIDOS_KEY, pokemons);
    }
  }

  Future<List<Pokemon>> getPokemonsObtidos() async {
    var shared = await SharedPreferences.getInstance();
    var pokemons = shared.getStringList(OBTIDOS_KEY);
    if (pokemons == null) {
      return [];
    }
    await atualizarListaPokemonsAntigos(pokemons);
    return shared
        .getStringList(OBTIDOS_KEY)!
        .map<Pokemon>((json) => Pokemon.fromJson(json))
        .toList();
  }

  atualizarListaPokemonsAntigos(List<String> pokemons) async {
    var pokemonsCarregados =
        pokemons.map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon)).toList();

    var deveRecarregar = pokemonsCarregados.firstWhere(
      (element) => element.cardType == CardType.PUBLIC,
      orElse: () => Pokemon(
        id: '',
        types: [],
        imageUrl: '',
        imageUrlHiRes: '',
        name: '',
        cardType: CardType.PUBLIC,
      ),
    );

    if (deveRecarregar != null) {
      var shared = await SharedPreferences.getInstance();
      shared.setStringList(OBTIDOS_KEY, []);
      for (Pokemon pokemon in pokemonsCarregados) {
        await adicionarListaObtidos(pokemon);
      }
    }
  }

  Future<List<Pokemon>> getAllPokemons() async {
    final response = await client.get('https://api.pokemontcg.io/v1/cards/');
    if (response.statusCode! <= 300) {
      var pokemons = response.data['cards'];
      return pokemons
          .map<Pokemon>((json) => Pokemon.fromMapJson(json))
          .toList();
    }
    return [];
  }
}
