import 'package:flutter/material.dart';
import 'package:pokemon_card/app/modules/home/all_cards_page.dart';
import 'package:pokemon_card/app/modules/home/home_controller.dart';
import 'package:pokemon_card/app/modules/home/my_cards_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> paginas = [
    AllCardsPage(),
    Container(),
    MyCardsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => trocarPagina(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive),
              label: 'cads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'obtidos',
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: paginas,
        ));
  }

  trocarPagina(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
