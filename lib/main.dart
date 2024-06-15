import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/views/navbase.dart';

void main() {
  runApp(ProviderScope(child: YetAnotherAnimeApp()));
}

class YetAnotherAnimeApp extends StatelessWidget {
  const YetAnotherAnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaana',
      home: Navbase(),
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.dark()),
    );
  }
}
