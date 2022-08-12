import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../core/widgets/search_view_widgets.dart';
import '../../product/init/network/network_product.dart';
import '../../product/widget/center_progress_indicator.dart';
import '../../product/widget/genre_cards.dart';
import '../../service/spotify_service.dart';
import '../view_model/searc_view_model.dart';

part 'search_view_part.dart';

class _SearchViewState extends SearchViewPart {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        return _searchViewModel.isLoading
            ? const CenterProgressIndicator()
            : MyCustomNestedScrollWidget(searchViewModel: _searchViewModel);
      },
    ));
  }
}

class MyCustomNestedScrollWidget extends StatelessWidget with SearchViewWidget {
  final SearchViewModel searchViewModel;

  const MyCustomNestedScrollWidget({
    Key? key,
    required this.searchViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            sliverAppBar(),
            sliverSearchBar(),
            const SliverTitle(),
            SliverGridFirstItems(searchViewModel: searchViewModel),
            const SliverSubtitle(),
            SliverGridAllItems(searchViewModel: searchViewModel),
          ];
        },
        body: const SizedBox(),
      ),
    );
  }
}

class SliverGridAllItems extends StatelessWidget {
  const SliverGridAllItems({
    Key? key,
    required this.searchViewModel,
  }) : super(key: key);

  final SearchViewModel searchViewModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: context.width / (0.3 * context.height),
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
      ),
      delegate: SliverChildBuilderDelegate(childCount: searchViewModel.typeItems.length - 4, (context, index) {
        index += 4;
        var typeItem = searchViewModel.typeItems[index];
        return GenreCards(
          genreName: typeItem.title ?? '',
          genreImageURL: typeItem.imageURL ?? '',
          backgroundColor: Color.fromARGB(
            255,
            typeItem.backgroundColor![0],
            typeItem.backgroundColor![1],
            typeItem.backgroundColor![2],
          ),
        );
      }),
    );
  }
}

class SliverGridFirstItems extends StatelessWidget {
  const SliverGridFirstItems({
    Key? key,
    required this.searchViewModel,
  }) : super(key: key);

  final SearchViewModel searchViewModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: context.width / (0.3 * context.height),
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
      ),
      delegate: SliverChildBuilderDelegate(childCount: searchViewModel.typeItems.length - 10, (context, index) {
        return GenreCards(
            genreName: searchViewModel.typeItems[index].title ?? '',
            genreImageURL: searchViewModel.typeItems[index].imageURL ?? '',
            backgroundColor: Color.fromARGB(
                255,
                searchViewModel.typeItems[index].backgroundColor![0],
                searchViewModel.typeItems[index].backgroundColor![1],
                searchViewModel.typeItems[index].backgroundColor![2]));
      }),
    );
  }
}
