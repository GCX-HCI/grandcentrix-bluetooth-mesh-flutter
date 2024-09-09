import 'package:freezed_annotation/freezed_annotation.dart';

part '../.generated/models/node.freezed.dart';

@freezed
class Node with _$Node {
  const factory Node({
    required String name,
    required String id,
  }) = _Node;
}
