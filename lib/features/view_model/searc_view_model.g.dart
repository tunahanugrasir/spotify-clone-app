// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searc_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on _SearchViewModelBase, Store {
  late final _$typeItemsAtom =
      Atom(name: '_SearchViewModelBase.typeItems', context: context);

  @override
  List<GenreModel> get typeItems {
    _$typeItemsAtom.reportRead();
    return super.typeItems;
  }

  @override
  set typeItems(List<GenreModel> value) {
    _$typeItemsAtom.reportWrite(value, super.typeItems, () {
      super.typeItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SearchViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchAllTypesAsyncAction =
      AsyncAction('_SearchViewModelBase.fetchAllTypes', context: context);

  @override
  Future<void> fetchAllTypes() {
    return _$fetchAllTypesAsyncAction.run(() => super.fetchAllTypes());
  }

  late final _$_SearchViewModelBaseActionController =
      ActionController(name: '_SearchViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_SearchViewModelBaseActionController.startAction(
        name: '_SearchViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
typeItems: ${typeItems},
isLoading: ${isLoading}
    ''';
  }
}
