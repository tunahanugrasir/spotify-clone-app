part of '../../features/views/home_view.dart';

Widget header(BuildContext context, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _headerTitle(title),
      _headerIcons(context),
    ],
  );
}

Expanded _headerTitle(String title) {
  return Expanded(
    flex: ExpandedUtils.mediumFlex,
    child: Text(title, style: ProductTheme.textTheme.headline4),
  );
}

Expanded _headerIcons(BuildContext context) {
  return Expanded(
    flex: ExpandedUtils.lowFlex,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _notificationIcon(context),
        const Icon(Icons.history_outlined, size: IconUtils.iconSizeNormal),
        const Icon(Icons.settings_outlined, size: IconUtils.iconSizeNormal),
      ],
    ),
  );
}

Stack _notificationIcon(BuildContext context) {
  return Stack(
    children: [
      const Icon(Icons.notifications_none_outlined, size: IconUtils.iconSizeNormal),
      Positioned(
        left: context.width / 70,
        top: context.height / 120,
        child: Container(
          height: context.height / 120,
          width: context.height / 120,
          decoration: ProductTheme().headerBoxDecoration,
        ),
      )
    ],
  );
}

Widget addTitle(String title) {
  return Padding(
    padding: const PaddingUtils.onlyLeftEight(),
    child: Text(title, style: ProductTheme.textTheme.headline4),
  );
}

class _RecentlyItems extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const _RecentlyItems({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.onlyTop(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeViewModel.recentlyModelItems.length,
          padding: const PaddingUtils.zero(),
          itemBuilder: (context, index) {
            RecentlyItemsModel recentlyModelItem = homeViewModel.recentlyModelItems[index];
            return RecentlyItem(recentlyModelItem: recentlyModelItem);
          },
        ),
      ),
    );
  }
}

class RecentlyItem extends StatelessWidget {
  const RecentlyItem({
    Key? key,
    required this.recentlyModelItem,
  }) : super(key: key);
  final int _maxLines = 2;

  final RecentlyItemsModel recentlyModelItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ProductTheme().recentlyItemBoxDecoration,
      child: Row(
        children: [
          Padding(
            padding: const PaddingUtils.onlyRight(),
            child: Container(
              height: context.height,
              width: context.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    recentlyModelItem.url ?? '',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: context.width / 4,
            child: Text(
              recentlyModelItem.title ?? '',
              style: ProductTheme.textTheme.headline2,
              maxLines: _maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const RecentlyPlayed({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.40,
          decoration: ProductTheme().homeViewStackBoxDecoration,
        ),
        Positioned(
          top: 50,
          left: 8,
          right: 8,
          bottom: 0,
          child: Column(
            children: [
              header(context, TitlesAndSubtitles.goodEvening.getString()),
              _RecentlyItems(
                homeViewModel: homeViewModel,
              )
            ],
          ),
        ),
      ],
    );
  }
}
