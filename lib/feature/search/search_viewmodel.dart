import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/data/mesh_repository.dart';
import 'package:nordic_nrf_mesh/nordic_nrf_mesh.dart';

part '../../.generated/feature/search/search_viewmodel.freezed.dart';

const String _viegaOpCode = '04'; // Defined CAN bus message
const String _viegaParameters = '0C22001201'; // Defined CAN bus message

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoadingProxyNodes,
    @Default(false) bool isLoadingMeshNodes,
    @Default(false) bool hasError,
    @Default(<Device>[]) List<Device> proxyNodes,
    @Default(<MeshNode>[]) List<MeshNode> meshNodes,
  }) = _SearchState;
}

class SearchViewModel extends ViewModel<SearchState> {
  final MeshRepository _meshRepository;
  StreamSubscription<Device>? _deviceSubscription;

  SearchViewModel({required MeshRepository meshRepository})
      : _meshRepository = meshRepository,
        super(const SearchState());

  @override
  Future<void> init() async {
    await _meshRepository.loadMeshNetwork();
  }

  void findProxyNodes() async {
    emit(
      state.copyWith(
        isLoadingProxyNodes: true,
        proxyNodes: [],
        meshNodes: [],
      ),
    );
    _deviceSubscription = _meshRepository
        .findProxyNodes()
        .where((proxyNode) =>
            state.proxyNodes.every((element) => element.uuid != proxyNode.uuid))
        .listen((proxyNode) {
      emit(
        state.copyWith(
          isLoadingProxyNodes: false,
          proxyNodes: [
            ...state.proxyNodes,
            ...{proxyNode}
          ],
        ),
      );
    });
  }

  void connect(Device proxyNode) async {
    _deviceSubscription?.cancel();
    emit(
      state.copyWith(
        isLoadingMeshNodes: true,
        meshNodes: [],
      ),
    );
    await _meshRepository.connect(proxyNode);
    final nodes = await _meshRepository.allNodes();
    emit(
      state.copyWith(
        isLoadingMeshNodes: false,
        meshNodes: nodes,
      ),
    );
  }

  void disconnect() async {
    await _meshRepository.disconnect();
    emit(
      state.copyWith(
        meshNodes: [],
      ),
    );
  }

  void changeColor(MeshNode node) async {
    final element = await node.node.firstElementWithVendorModel;
    final vendorModel = element.firstVendorModel;

    final result = await _meshRepository.sendVendorModelMessage(
      address: element.address,
      modelId: vendorModel.modelId,
      opCode: _viegaOpCode,
      parameters: _viegaParameters,
      keyIndex: vendorModel.boundAppKey.firstOrNull ?? 0,
    );
    print(result);
  }

  @override
  Future<void> close() {
    _deviceSubscription?.cancel();
    return super.close();
  }
}

extension _VendorModelSearch on ProvisionedMeshNode {
  Future<ElementData> get firstElementWithVendorModel async {
    final elements = await this.elements;
    return elements.firstWhere(
      (element) => element.hasVendorModel,
      orElse: () => elements.first,
    );
  }
}

extension _VendorModelGetter on ElementData {
  ModelData get firstVendorModel => models.firstWhere(
        (model) => model.isVendorModel,
        orElse: () => models.first,
      );

  bool get hasVendorModel => models.any((model) => model.isVendorModel);
}

extension _VendorModelCheck on ModelData {
  bool get isVendorModel => (modelId & 0xFFFF0000) != 0;
}
