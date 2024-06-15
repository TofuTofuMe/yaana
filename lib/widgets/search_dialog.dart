import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  final Function(String) onSearch;

  const SearchDialog({super.key, required this.onSearch});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final _searchController = TextEditingController();

  void _search() {
    if (_searchController.text.isNotEmpty) {
      widget.onSearch(_searchController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      children: [
        TextField(
          autofocus: true,
          controller: _searchController,
          onSubmitted: (_) => _search(),
          maxLength: 24,
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: _search,
          child: Text('Search'),
        )
      ],
    );
  }
}

void showSearchDialog(BuildContext context, Function(String) onSearch) async {
  await showDialog(
      context: context, builder: (context) => SearchDialog(onSearch: onSearch));
}
