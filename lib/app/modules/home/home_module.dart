import 'package:flutter/material.dart';
import 'package:pokemon_card/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/home_page.dart';
import 'package:pokemon_card/app/shared/constants/routes.dart';
import 'package:pokemon_card/app/modules/home/home_module.dart';

class HomeModule extends Module {
  List<ModularRoute> get routers => [
        ChildRoute(
          Routes.home,
          child: (_) => const HomePage(),
        ),
      ];
}
