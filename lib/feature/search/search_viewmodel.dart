import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:mesh/data/mesh_repository.dart';
import 'package:mesh/util/permission_checker.dart';
import 'package:nordic_nrf_mesh/nordic_nrf_mesh.dart';

part '../../.generated/feature/search/search_viewmodel.freezed.dart';

// Defined CAN bus message OP code to change the LED color
const String _viegaChangeColorOpCode = '04';
// Defined CAN bus message parameters to change the LED color
const String _viegaChangeColorParameters = '0C22001201';

// Defined CAN bus message OP code to trigger the motor
const String _viegaTriggerMotorOpCode = '04';
// Defined CAN bus message parameters to trigger the motor
const String _viegaTriggerMotorParameters = '0125001301';

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
  final PermissionChecker _permissionChecker;
  StreamSubscription<Device>? _deviceSubscription;

  SearchViewModel({
    required MeshRepository meshRepository,
    required PermissionChecker permissionChecker,
  })  : _meshRepository = meshRepository,
        _permissionChecker = permissionChecker,
        super(const SearchState());

  @override
  Future<void> init() async {
    await _meshRepository.loadMeshNetwork();
  }

  void findProxyNodes() async {
    await _permissionChecker.checkBluetoothPermission();
    await _permissionChecker.checkLocationPermission();
    await _permissionChecker.checkBluetoothScanPermission();
    await _permissionChecker.checkBluetoothConnectPermission();

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
      opCode: _viegaChangeColorOpCode,
      parameters: _viegaChangeColorParameters,
      keyIndex: vendorModel.boundAppKey.firstOrNull ?? 0,
    );
    print(result);
  }

  void triggerMotor(MeshNode node) async {
    final element = await node.node.firstElementWithVendorModel;
    final vendorModel = element.firstVendorModel;

    final result = await _meshRepository.sendVendorModelMessage(
      address: element.address,
      modelId: vendorModel.modelId,
      opCode: _viegaTriggerMotorOpCode,
      parameters: _viegaTriggerMotorParameters,
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
