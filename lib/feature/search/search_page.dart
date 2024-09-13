import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/data/mesh_repository.dart';
import 'package:mesh/feature/search/search_viewmodel.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SearchViewModel>(
      create: (context) => SearchViewModel(
        meshRepository: context.read<MeshRepository>(),
      ),
      child: BlocBuilder<SearchViewModel, SearchState>(
        builder: (context, state) {
          final viewModel = context.watch<SearchViewModel>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Viega Mesh Network Demo'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                    onPressed: viewModel.findProxyNodes,
                    child: const Text('Find Proxy Nodes'),
                  ),
                  const SizedBox(height: 24),
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final node = state.proxyNodes.elementAt(index);
                            return Card(
                              child: Column(
                                children: [
                                  Text(
                                    '${node.name} (${node.id})',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  TextButton(
                                    onPressed: () => viewModel.connect(node.id),
                                    child: const Text('Connect'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        viewModel.disconnect(node.id),
                                    child: const Text('Disconnect'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        viewModel.changeColor(node.id),
                                    child: const Text('Change Color'),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: state.proxyNodes.length,
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
