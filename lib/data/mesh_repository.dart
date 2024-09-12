import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesh/models/node.dart';
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

  Stream<Node> findProxyNodes() {
    return _nordicNrfMesh
        .scanForProxy()
        .map((device) => Node(name: device.name, id: device.id));
  }

  Future<void> connect(Node node) async {
    final device =
        await _nordicNrfMesh.searchForSpecificNode(node.id, isProxy: true);
    if (device != null) {
      _bleMeshManager.callbacks = _Callbacks(_bleMeshManager);
      await _bleMeshManager.connect(device);
    } else {
      // TODO
    }
  }

  Future<void> disconnect(Node node) async {
    await _bleMeshManager.disconnect();
  }

  Future<void> sendVendorModelMessage(
      {required int address,
      required int modelId,
      required int companyIdentifier,
      required String opCode,
      required String parameters}) async {
    final nodes = await _nordicNrfMesh.meshManagerApi.meshNetwork?.nodes;
    final node = nodes?.last;
    final elements = await node?.elements;
    final element = elements!.last;
    final model = element.models.last;
    modelId = model.modelId;
    address = element.address;
    companyIdentifier = modelId.toInt16();
    _nordicNrfMesh.meshManagerApi.sendVendorModelMessage(
      address,
      modelId,
      companyIdentifier,
      opCode,
      parameters,
      keyIndex: model.boundAppKey.first,
    );
  }
}

extension Int16 on int {
  int toInt16() {
    final bytes = Uint8List(4)
      ..buffer.asByteData().setInt32(0, this, Endian.big);
    final buffer = bytes.buffer;
    final byteData = ByteData.view(buffer);
    int short = byteData.getInt16(0, Endian.big);
    return short;
  }
}

class _Callbacks extends BleMeshManagerCallbacks {
  final BleMeshManager _bleMeshManager;

  _Callbacks(BleMeshManager bleMeshManager) : _bleMeshManager = bleMeshManager;

  @override
  Future<void> sendMtuToMeshManagerApi(int mtu) async {
    _bleMeshManager.mtuSize = mtu;
  }
}

final meshRepositoryProvider =
    RepositoryProvider<MeshRepository>(create: (context) {
  return MeshRepository(
    networkJsonAssetPath: 'assets/files/network.json',
  );
});
