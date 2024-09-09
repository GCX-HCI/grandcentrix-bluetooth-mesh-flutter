import 'package:flutter/material.dart';
import 'package:mesh/feature/search/search_page.dart';

class MeshNetworkApp extends StatelessWidget {
  const MeshNetworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viega Mesh Network Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}
