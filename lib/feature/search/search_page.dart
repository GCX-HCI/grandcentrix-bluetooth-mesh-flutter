import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/feature/search/search_viewmodel.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SearchViewModel>(
      create: (context) => SearchViewModel(),
      child: BlocBuilder<SearchViewModel, SearchState>(
        builder: (context, state) {
          final viewModel = context.watch<SearchViewModel>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Viega Mesh Network Demo'),
            ),
            body: const Center(
              child: Text('Demo'),
            ),
          );
        },
      ),
    );
  }
}
