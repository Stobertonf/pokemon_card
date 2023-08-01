import 'package:dio/io.dart';

import 'home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/home_controller.dart';
import 'package:pokemon_card/app/modules/home/pokemon_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => PokemonRepository(
            i.get<DioForNative>(),
          ),
        ),
        Bind.singleton(
          (i) => HomeController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => HomePage(),
        ),
      ];
}
