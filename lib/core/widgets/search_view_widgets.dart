import 'package:flutter/material.dart';
import 'package:spotify_clone_app/utilities/project_utils.dart';

import '../../product/theme/product_theme.dart';
import '../../utilities/extensions/enum_extension.dart';

abstract class SearchViewWidget {
  SliverAppBar sliverSearchBar() {
    var enabled2 = false;
    return SliverAppBar(
      pinned: true,
      expandedHeight: 0,
      toolbarHeight: 0,
      backgroundColor: ColorsScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const PaddingUtils.onlyTop(),
          child: TextField(
            cursorColor: ColorsScheme.primary,
            decoration: InputDecoration(
              enabled: enabled2,
              prefixIcon: const Icon(
                Icons.search_outlined,
                size: IconUtils.iconSizeBig,
              ),
              hintText: SearchViewTexts.hintText.getText(),
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
          padding: const PaddingUtils.songs(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                SearchViewTexts.search.getText(),
                style: ProductTheme.textTheme.headline5,
              ),
              const Icon(
                Icons.camera_alt_outlined,
                size: IconUtils.iconSizeBig,
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
        padding: const PaddingUtils.searchViewSymmetric(),
        child: Text(
          SearchViewTexts.browse.getText(),
          style: ProductTheme.textTheme.subtitle1,
        ),
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
        padding: const PaddingUtils.searchViewSymmetric(),
        child: Text(
          SearchViewTexts.genres.getText(),
          style: ProductTheme.textTheme.subtitle1,
        ),
      ),
    );
  }
}
