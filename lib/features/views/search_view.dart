import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:spotify_clone_app/features/view_model/searc_view_model.dart';
import 'package:spotify_clone_app/features/views/home_view.dart';
import 'package:spotify_clone_app/product/product_index.dart';

import '../../service/spotify_service.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final SearchViewModel _searchViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchAllData();
  }

  void _fetchAllData() {
    _searchViewModel = SearchViewModel(SpotifyService(NetworkProduct.instance.networkManager));
    _searchViewModel.fetchAllTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        return _searchViewModel.isLoading
            ? centerProgressIndicator()
            : MyCustomNestedScrollWidget(searchViewModel: _searchViewModel);
      },
    ));
  }
}

class MyCustomNestedScrollWidget extends StatelessWidget {
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
            _sliverAppBar(),
            _sliverSearchBar(),
            _title(),
            SliverGridFirstItems(searchViewModel: searchViewModel),
            _subtitle(),
            SliverGridAllItems(searchViewModel: searchViewModel),
            SliverGridAllItems(searchViewModel: searchViewModel),
            SliverGridAllItems(searchViewModel: searchViewModel),
          ];
        },
        body: const SizedBox(),
      ),
    );
  }

  SliverToBoxAdapter _subtitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Text("Browse all", style: ProductTheme.textTheme.subtitle1),
      ),
    );
  }

  SliverToBoxAdapter _title() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Text("Your top genres", style: ProductTheme.textTheme.subtitle1),
      ),
    );
  }

  SliverAppBar _sliverSearchBar() {
    return const SliverAppBar(
      pinned: true,
      expandedHeight: 0,
      toolbarHeight: 0,
      backgroundColor: ColorsScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 16),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabled: false,
              prefixIcon: Icon(
                Icons.search_outlined,
                size: 31,
              ),
              hintText: 'Artists, songs, or podcasts',
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      backgroundColor: ColorsScheme.primary,
      expandedHeight: 0,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: ProductTheme.textTheme.headline5,
              ),
              const Icon(
                Icons.camera_alt_outlined,
                size: 31,
              )
            ],
          ),
        ),
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
