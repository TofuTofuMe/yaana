import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/providers/animelist_provider.dart';
import 'package:yaana/providers/config_provider.dart';
import 'package:yaana/data/client.dart';
import 'package:yaana/views/home.dart';
import 'package:yaana/views/settings.dart';
import 'package:yaana/widgets/search_dialog.dart';

class Navbase extends ConsumerStatefulWidget {
  const Navbase({super.key});

  @override
  ConsumerState<Navbase> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbase> {
  int _selectedIndex = 0;

  static onSearchPress(BuildContext context, WidgetRef ref) {
    final animeService = ref.read(configProvider).animeService;
    showSearchDialog(context, (query) async {
      ref
          .read(animeListProvider.notifier)
          .setList(await searchAnime(animeService, query));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'yetanotheranimeapp',
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
        onPressed: () => onSearchPress(context, ref),
        tooltip: 'Search',
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: <Widget>[Home(), Settings()][_selectedIndex],
    );
  }
}
