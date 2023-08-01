import 'package:flutter/material.dart';
import 'package:pokemon_card/app/app_module.dart';
import 'package:pokemon_card/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
