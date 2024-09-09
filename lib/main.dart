import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesh/app.dart';
import 'package:mesh/data/mesh_repository.dart';

void main() async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        meshRepositoryProvider,
      ],
      child: const MeshNetworkApp(),
    ),
  );
}
