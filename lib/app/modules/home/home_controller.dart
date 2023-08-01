import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_card/app/modules/home/pokemon_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokemonRepository repository = Modular.get<PokemonRepository>();

  @observable
  List<Pokemon> pokemons = ObservableList();

  @action
  atualizarPokemonsObtidos() async {
    pokemons = await _atualizarPokemonsObtidos();
  }

  List<Pokemon> getPokemonsObtidos() => pokemons;

  Future<List<Pokemon>> _atualizarPokemonsObtidos() {
    return repository.getPokemonsObtidos();
  }

  Future<List<Pokemon>> getAllPokemons() {
    return repository.getAllPokemons();
  }

  adicionarListaObtidos(Pokemon pokemon) {
    repository.adicionarListaObtidos(pokemon);
    atualizarPokemonsObtidos();
  }
}
