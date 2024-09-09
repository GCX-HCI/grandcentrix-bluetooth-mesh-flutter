import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mesh/architecture/mvvm.dart';
import 'package:nordic_nrf_mesh/nordic_nrf_mesh.dart';

part '../../.generated/feature/search/search_viewmodel.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _SearchState;
}

class SearchViewModel extends ViewModel<SearchState> {
  SearchViewModel() : super(const SearchState());

  @override
  Future<void> init() async {
  }
}
