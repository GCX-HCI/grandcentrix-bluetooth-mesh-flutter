import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/data/mesh_repository.dart';

part '../../.generated/feature/search/search_viewmodel.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(<Device>[]) List<Device> proxyNodes,
    @Default(<MeshNode>[]) List<MeshNode> meshNodes,
  }) = _SearchState;
}

class SearchViewModel extends ViewModel<SearchState> {
  final MeshRepository _meshRepository;
  StreamSubscription<Device>? _subscription;

  SearchViewModel({required MeshRepository meshRepository})
      : _meshRepository = meshRepository,
        super(const SearchState());

  @override
  Future<void> init() async {
    await _meshRepository.loadMeshNetwork();
  }

  void findProxyNodes() async {
    emit(state.copyWith(isLoading: true));
    _subscription = _meshRepository
        .findProxyNodes()
        .where((proxyNode) =>
            state.proxyNodes.every((element) => element.uuid != proxyNode.uuid))
        .listen((proxyNode) {
      emit(state.copyWith(
        isLoading: false,
        proxyNodes: [
          ...state.proxyNodes,
          ...{proxyNode}
        ],
      ));
    });
  }

  void connect(Device proxyNode) async {
    await _meshRepository.connect(proxyNode);
    final nodes = await _meshRepository.allNodes();
    emit(state.copyWith(
      isLoading: false,
      meshNodes: nodes,
    ));
  }

  void disconnect() async {
    await _meshRepository.disconnect();
  }

  void changeColor(MeshNode node) async {
    final elements = await node.node.elements;
    final element = elements.last;
    final model = element.models.last;
    final modelId = model.modelId;
    final address = element.address;
    const String opCode = '04';
    const String parameters = '0C22001201';

    final result = await _meshRepository.sendVendorModelMessage(
      address: address,
      modelId: modelId,
      opCode: opCode,
      parameters: parameters,
      keyIndex: model.boundAppKey.first,
    );
    print(result);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
