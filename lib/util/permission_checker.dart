import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionChecker {
  Future<void> checkBluetoothPermission() async {
    const permission = Permission.bluetooth;
    await _checkAndRequest(permission);
  }

  Future<void> checkBluetoothScanPermission() async {
    const permission = Permission.bluetoothScan;
    await _checkAndRequest(permission);
  }

  Future<void> checkBluetoothConnectPermission() async {
    const permission = Permission.bluetoothConnect;
    await _checkAndRequest(permission);
  }

  Future<void> checkLocationPermission() async {
    const permission = Permission.locationWhenInUse;
    await _checkAndRequest(permission);
  }

  Future<void> _checkAndRequest(Permission permission) async {
    final status = await permission.status;

    if (!status.isGranted) {
      await permission.request();
    }
  }
}

final permissionCheckerProvider =
    RepositoryProvider<PermissionChecker>(create: (context) {
  return PermissionChecker();
});
