import 'package:flutter/material.dart';
import 'package:yaana/widgets/anime_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Center(child: const AnimeListWidget())));
  }
}
