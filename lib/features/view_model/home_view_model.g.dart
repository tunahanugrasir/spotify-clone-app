// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$albumModelItemsAtom =
      Atom(name: '_HomeViewModelBase.albumModelItems', context: context);

  @override
  List<AlbumModel> get albumModelItems {
    _$albumModelItemsAtom.reportRead();
    return super.albumModelItems;
  }

  @override
  set albumModelItems(List<AlbumModel> value) {
    _$albumModelItemsAtom.reportWrite(value, super.albumModelItems, () {
      super.albumModelItems = value;
    });
  }

  late final _$podcastModelItemsAtom =
      Atom(name: '_HomeViewModelBase.podcastModelItems', context: context);

  @override
  List<PodcastModel> get podcastModelItems {
    _$podcastModelItemsAtom.reportRead();
    return super.podcastModelItems;
  }

  @override
  set podcastModelItems(List<PodcastModel> value) {
    _$podcastModelItemsAtom.reportWrite(value, super.podcastModelItems, () {
      super.podcastModelItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

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

  late final _$fetchAllDatasAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchAllDatas', context: context);

  @override
  Future<void> fetchAllDatas() {
    return _$fetchAllDatasAsyncAction.run(() => super.fetchAllDatas());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
albumModelItems: ${albumModelItems},
podcastModelItems: ${podcastModelItems},
isLoading: ${isLoading}
    ''';
  }
}
