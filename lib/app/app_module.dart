import 'modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_card/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routers => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
