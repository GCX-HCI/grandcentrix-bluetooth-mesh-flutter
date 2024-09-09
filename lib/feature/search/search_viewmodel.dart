import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/data/mesh_repository.dart';
import 'package:mesh/models/node.dart';

part '../../.generated/feature/search/search_viewmodel.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(<Node>{}) Set<Node> nodes,
  }) = _SearchState;
}

class SearchViewModel extends ViewModel<SearchState> {
  final MeshRepository _meshRepository;
  StreamSubscription<Node>? _subscription;

  SearchViewModel({required MeshRepository meshRepository})
      : _meshRepository = meshRepository,
        super(const SearchState());

  @override
  Future<void> init() async {
    await _meshRepository.loadMeshNetwork();
  }

  void findProxyNodes() async {
    emit(state.copyWith(isLoading: true));
    _subscription = _meshRepository.findProxyNodes().listen((node) {
      emit(state.copyWith(isLoading: false, nodes: {
        ...state.nodes,
        ...{node}
      }));
    });
  }

  void connect(String id) async {
    await _meshRepository.connect(_findNodeById(id));
  }

  void disconnect(String id) async {
    await _meshRepository.disconnect(_findNodeById(id));
  }

  void changeColor(String id) async {
    await _meshRepository.sendMessage([]);
  }

  Node _findNodeById(String id) =>
      state.nodes.where((node) => node.id == id).first;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
