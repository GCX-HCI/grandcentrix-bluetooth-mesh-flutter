import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh/nordic_nrf_mesh.dart';

class MeshRepository {
  final NordicNrfMesh _nordicNrfMesh;
  final BleMeshManager _bleMeshManager;
  final String _networkJsonAssetPath;

  MeshRepository({
    NordicNrfMesh? nordicNrfMesh,
    BleMeshManager? bleMeshManager,
    required String networkJsonAssetPath,
  })  : _nordicNrfMesh = nordicNrfMesh ?? NordicNrfMesh(),
        _bleMeshManager = bleMeshManager ?? BleMeshManager(),
        _networkJsonAssetPath = networkJsonAssetPath;

  Future<IMeshNetwork> loadMeshNetwork() async {
    final fileContent = await rootBundle.loadString(_networkJsonAssetPath);
    return _nordicNrfMesh.meshManagerApi.importMeshNetworkJson(fileContent);
  }

  Stream<DiscoveredDevice> findProxyNodes() {
    return _nordicNrfMesh.scanForProxy();
  }

  Future<List<ProvisionedMeshNode>> allNodes() async {
    return await _nordicNrfMesh.meshManagerApi.meshNetwork?.nodes ??
        <ProvisionedMeshNode>[];
  }

  Future<void> connect(DiscoveredDevice node) async {
    final device =
        await _nordicNrfMesh.searchForSpecificNode(node.id, isProxy: true);
    if (device != null) {
      _bleMeshManager.callbacks = _Callbacks(
        _nordicNrfMesh.meshManagerApi,
        _bleMeshManager,
      );
      await _bleMeshManager.connect(device);
    } else {
      // TODO
    }
  }

  Future<void> disconnect() async {
    await _bleMeshManager.disconnect();
  }

  Future<Map<String, dynamic>> sendVendorModelMessage({
    required int address,
    required int modelId,
    required String opCode,
    required String parameters,
    int keyIndex = 0,
  }) {
    return _nordicNrfMesh.meshManagerApi.sendVendorModelMessage(
      address,
      modelId,
      opCode,
      parameters,
      keyIndex: keyIndex,
    );
  }
}

class _Callbacks extends BleMeshManagerCallbacks {
  final MeshManagerApi _meshManagerApi;
  late StreamSubscription<List<int>> _onMeshPduCreatedSubscription;
  late StreamSubscription<BleMeshManagerCallbacksDataReceived>
      _onDataReceivedSubscription;
  late StreamSubscription<BleMeshManagerCallbacksDataSent>
      _onDataSentSubscription;

  _Callbacks(MeshManagerApi meshManagerApi, BleMeshManager bleMeshManager)
      : _meshManagerApi = meshManagerApi {
    _onMeshPduCreatedSubscription =
        meshManagerApi.onMeshPduCreated.listen((event) async {
      print('onMeshPduCreated $event');
      await bleMeshManager.sendPdu(event);
    });
    _onDataReceivedSubscription = onDataReceived.listen((event) async {
      print('onDataReceived ${event.device.id} ${event.pdu} ${event.mtu}');
      await meshManagerApi.handleNotifications(event.mtu, event.pdu);
    });
    _onDataSentSubscription = onDataSent.listen((event) async {
      print('onDataSent ${event.device.id} ${event.pdu} ${event.mtu}');
      await meshManagerApi.handleWriteCallbacks(event.mtu, event.pdu);
    });
  }

  @override
  Future<void> sendMtuToMeshManagerApi(int mtu) async {
    _meshManagerApi.setMtu(mtu);
  }

  @override
  Future<void> dispose() => Future.wait([
        _onDataReceivedSubscription.cancel(),
        _onDataSentSubscription.cancel(),
        _onMeshPduCreatedSubscription.cancel(),
        super.dispose(),
      ]);
}

final meshRepositoryProvider =
    RepositoryProvider<MeshRepository>(create: (context) {
  return MeshRepository(
    networkJsonAssetPath: 'assets/files/network.json',
  );
});
