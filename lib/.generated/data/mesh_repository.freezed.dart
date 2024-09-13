// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../data/mesh_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeshNode {
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  ProvisionedMeshNode get node => throw _privateConstructorUsedError;

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeshNodeCopyWith<MeshNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshNodeCopyWith<$Res> {
  factory $MeshNodeCopyWith(MeshNode value, $Res Function(MeshNode) then) =
      _$MeshNodeCopyWithImpl<$Res, MeshNode>;
  @useResult
  $Res call({String name, String uuid, ProvisionedMeshNode node});
}

/// @nodoc
class _$MeshNodeCopyWithImpl<$Res, $Val extends MeshNode>
    implements $MeshNodeCopyWith<$Res> {
  _$MeshNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? node = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      node: null == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ProvisionedMeshNode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeshNodeImplCopyWith<$Res>
    implements $MeshNodeCopyWith<$Res> {
  factory _$$MeshNodeImplCopyWith(
          _$MeshNodeImpl value, $Res Function(_$MeshNodeImpl) then) =
      __$$MeshNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String uuid, ProvisionedMeshNode node});
}

/// @nodoc
class __$$MeshNodeImplCopyWithImpl<$Res>
    extends _$MeshNodeCopyWithImpl<$Res, _$MeshNodeImpl>
    implements _$$MeshNodeImplCopyWith<$Res> {
  __$$MeshNodeImplCopyWithImpl(
      _$MeshNodeImpl _value, $Res Function(_$MeshNodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? node = null,
  }) {
    return _then(_$MeshNodeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      node: null == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as ProvisionedMeshNode,
    ));
  }
}

/// @nodoc

class _$MeshNodeImpl implements _MeshNode {
  const _$MeshNodeImpl(
      {required this.name, required this.uuid, required this.node});

  @override
  final String name;
  @override
  final String uuid;
  @override
  final ProvisionedMeshNode node;

  @override
  String toString() {
    return 'MeshNode(name: $name, uuid: $uuid, node: $node)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshNodeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.node, node) || other.node == node));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, node);

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshNodeImplCopyWith<_$MeshNodeImpl> get copyWith =>
      __$$MeshNodeImplCopyWithImpl<_$MeshNodeImpl>(this, _$identity);
}

abstract class _MeshNode implements MeshNode {
  const factory _MeshNode(
      {required final String name,
      required final String uuid,
      required final ProvisionedMeshNode node}) = _$MeshNodeImpl;

  @override
  String get name;
  @override
  String get uuid;
  @override
  ProvisionedMeshNode get node;

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeshNodeImplCopyWith<_$MeshNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Device {
  String get name => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  DiscoveredDevice get device => throw _privateConstructorUsedError;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call({String name, String uuid, DiscoveredDevice device});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
          _$DeviceImpl value, $Res Function(_$DeviceImpl) then) =
      __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String uuid, DiscoveredDevice device});
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
      _$DeviceImpl _value, $Res Function(_$DeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uuid = null,
    Object? device = null,
  }) {
    return _then(_$DeviceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DiscoveredDevice,
    ));
  }
}

/// @nodoc

class _$DeviceImpl implements _Device {
  const _$DeviceImpl(
      {required this.name, required this.uuid, required this.device});

  @override
  final String name;
  @override
  final String uuid;
  @override
  final DiscoveredDevice device;

  @override
  String toString() {
    return 'Device(name: $name, uuid: $uuid, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, uuid, device);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);
}

abstract class _Device implements Device {
  const factory _Device(
      {required final String name,
      required final String uuid,
      required final DiscoveredDevice device}) = _$DeviceImpl;

  @override
  String get name;
  @override
  String get uuid;
  @override
  DiscoveredDevice get device;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
