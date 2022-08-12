import 'package:flutter/material.dart';

import '../../product/theme/product_theme.dart';

abstract class SearchViewWidget {
  SliverAppBar sliverSearchBar() {
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

  SliverAppBar sliverAppBar() {
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

class SliverSubtitle extends StatelessWidget {
  const SliverSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Text("Browse all", style: ProductTheme.textTheme.subtitle1),
      ),
    );
  }
}

class SliverTitle extends StatelessWidget {
  const SliverTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Text("Your top genres", style: ProductTheme.textTheme.subtitle1),
      ),
    );
  }
}
