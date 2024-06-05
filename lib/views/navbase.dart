import 'package:flutter/material.dart';
import 'package:yaana/views/home.dart';
import 'package:yaana/views/settings.dart';

class Navbase extends StatefulWidget {
  const Navbase({super.key});

  @override
  State<Navbase> createState() => _NavbarState();
}

class _NavbarState extends State<Navbase> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'yet another anime app',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        )),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => {print('Search button pressed')},
        tooltip: 'Search',
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: <Widget>[Home(), Settings()][_selectedIndex],
    );
  }
}
