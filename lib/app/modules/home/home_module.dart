import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/home_page.dart';

class HomeModule extends Module {
  List<ModularRoute> get routers => [
        ChildRoute(
          Modular.initialRoute,
          child: (_) => const HomePage(),
        ),
      ];
}
