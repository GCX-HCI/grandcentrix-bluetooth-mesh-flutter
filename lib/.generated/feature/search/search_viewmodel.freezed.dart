// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../feature/search/search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<Device> get proxyNodes => throw _privateConstructorUsedError;
  List<MeshNode> get meshNodes => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<Device> proxyNodes,
      List<MeshNode> meshNodes});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? proxyNodes = null,
    Object? meshNodes = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      proxyNodes: null == proxyNodes
          ? _value.proxyNodes
          : proxyNodes // ignore: cast_nullable_to_non_nullable
              as List<Device>,
      meshNodes: null == meshNodes
          ? _value.meshNodes
          : meshNodes // ignore: cast_nullable_to_non_nullable
              as List<MeshNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      List<Device> proxyNodes,
      List<MeshNode> meshNodes});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? proxyNodes = null,
    Object? meshNodes = null,
  }) {
    return _then(_$SearchStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      proxyNodes: null == proxyNodes
          ? _value._proxyNodes
          : proxyNodes // ignore: cast_nullable_to_non_nullable
              as List<Device>,
      meshNodes: null == meshNodes
          ? _value._meshNodes
          : meshNodes // ignore: cast_nullable_to_non_nullable
              as List<MeshNode>,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      final List<Device> proxyNodes = const <Device>[],
      final List<MeshNode> meshNodes = const <MeshNode>[]})
      : _proxyNodes = proxyNodes,
        _meshNodes = meshNodes;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  final List<Device> _proxyNodes;
  @override
  @JsonKey()
  List<Device> get proxyNodes {
    if (_proxyNodes is EqualUnmodifiableListView) return _proxyNodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proxyNodes);
  }

  final List<MeshNode> _meshNodes;
  @override
  @JsonKey()
  List<MeshNode> get meshNodes {
    if (_meshNodes is EqualUnmodifiableListView) return _meshNodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meshNodes);
  }

  @override
  String toString() {
    return 'SearchState(isLoading: $isLoading, hasError: $hasError, proxyNodes: $proxyNodes, meshNodes: $meshNodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality()
                .equals(other._proxyNodes, _proxyNodes) &&
            const DeepCollectionEquality()
                .equals(other._meshNodes, _meshNodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      hasError,
      const DeepCollectionEquality().hash(_proxyNodes),
      const DeepCollectionEquality().hash(_meshNodes));

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final bool isLoading,
      final bool hasError,
      final List<Device> proxyNodes,
      final List<MeshNode> meshNodes}) = _$SearchStateImpl;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<Device> get proxyNodes;
  @override
  List<MeshNode> get meshNodes;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
