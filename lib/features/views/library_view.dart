import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/widgets/library_view.widgets.dart';
import '../../product/init/network/network_product.dart';
import '../../product/widget/center_progress_indicator.dart';
import '../../service/spotify_service.dart';
import '../view_model/library_view_model.dart';

part 'library_view_part.dart';

class _LibraryViewState extends LibraryViewPart {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return _libraryViewModel.isLoading
          ? const CenterProgressIndicator()
          : LibraryNestedScrollView(libraryViewModel: _libraryViewModel);
    }));
  }
}

class LibraryNestedScrollView extends StatelessWidget {
  final LibraryViewModel libraryViewModel;
  const LibraryNestedScrollView({Key? key, required this.libraryViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          HeaderAndIcons(),
          const SliverCategories(),
          SliverListBuilder(libraryViewModel: libraryViewModel),
        ];
      }),
      body: const SizedBox(),
    );
  }
}

class SliverListBuilder extends StatelessWidget {
  const SliverListBuilder({
    Key? key,
    required this.libraryViewModel,
  }) : super(key: key);

  final LibraryViewModel libraryViewModel;
  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: SliverOverlapAbsorberHandle(),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
        childCount: libraryViewModel.libraryModelItems.length,
        (context, index) {
          bool isPinned = libraryViewModel.libraryModelItems[index].pinned ?? false;
          return LibraryItem(
            libraryViewModel: libraryViewModel,
            isPinned: isPinned,
            image: libraryViewModel.libraryModelItems[index].image ?? '',
            title: libraryViewModel.libraryModelItems[index].title ?? '',
            subTitle: libraryViewModel.libraryModelItems[index].subtitle ?? '',
          );
        },
      )),
    );
  }
}
