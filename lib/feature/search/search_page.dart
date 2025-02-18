import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/data/mesh_repository.dart';
import 'package:mesh/feature/search/search_viewmodel.dart';
import 'package:mesh/util/permission_checker.dart';

const Color viegaYellow = Color(0xFFffed00);

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SearchViewModel>(
      create: (context) => SearchViewModel(
        meshRepository: context.read<MeshRepository>(),
        permissionChecker: context.read<PermissionChecker>(),
      ),
      child: BlocBuilder<SearchViewModel, SearchState>(
        builder: (context, state) {
          final viewModel = context.watch<SearchViewModel>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Image(
                  image: AssetImage('assets/images/viega.png'),
                ),
              ),
              title: Text(
                'Viega Mesh Demo',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                    onPressed: viewModel.importMeshConfiguration,
                    child: const Text('Import Mesh Configuration'),
                  ),
                  TextButton(
                    onPressed: viewModel.findProxyNodes,
                    child: const Text('Find Proxy Nodes'),
                  ),
                  const SizedBox(height: 24),
                  state.isLoadingProxyNodes
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final proxyNode = state.proxyNodes.elementAt(index);
                            return Card(
                              color: viegaYellow,
                              child: Column(
                                children: [
                                  Text(
                                    proxyNode.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    '(${proxyNode.uuid})',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            viewModel.connect(proxyNode),
                                        child: const Text('Connect'),
                                      ),
                                      const SizedBox(width: 16),
                                      TextButton(
                                        onPressed: () => viewModel.disconnect(),
                                        child: const Text('Disconnect'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: state.proxyNodes.length,
                        ),
                  const SizedBox(height: 24),
                  state.isLoadingMeshNodes
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final node = state.meshNodes.elementAt(index);
                            return Card(
                              color: viegaYellow,
                              child: Column(
                                children: [
                                  Text(
                                    node.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    '(${node.uuid})',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () =>
                                            viewModel.discover(node),
                                        child: const Text('Discover'),
                                      ),
                                      const SizedBox(width: 16),
                                      TextButton(
                                        onPressed: () =>
                                            viewModel.cleaningFunction(node),
                                        child: const Text('Cleaning Function'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: state.meshNodes.length,
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
