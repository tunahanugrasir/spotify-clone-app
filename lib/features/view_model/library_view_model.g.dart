// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LibraryViewModel on _LibraryViewModelBase, Store {
  late final _$libraryModelItemsAtom =
      Atom(name: '_LibraryViewModelBase.libraryModelItems', context: context);

  @override
  List<LibraryModel> get libraryModelItems {
    _$libraryModelItemsAtom.reportRead();
    return super.libraryModelItems;
  }

  @override
  set libraryModelItems(List<LibraryModel> value) {
    _$libraryModelItemsAtom.reportWrite(value, super.libraryModelItems, () {
      super.libraryModelItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LibraryViewModelBase.isLoading', context: context);

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

  late final _$fetchAllDataAsyncAction =
      AsyncAction('_LibraryViewModelBase.fetchAllData', context: context);

  @override
  Future<void> fetchAllData() {
    return _$fetchAllDataAsyncAction.run(() => super.fetchAllData());
  }

  late final _$_LibraryViewModelBaseActionController =
      ActionController(name: '_LibraryViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_LibraryViewModelBaseActionController.startAction(
        name: '_LibraryViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_LibraryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
libraryModelItems: ${libraryModelItems},
isLoading: ${isLoading}
    ''';
  }
}
