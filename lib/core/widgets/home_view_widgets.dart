part of '../../features/views/home_view.dart';

abstract class ViewWidgets {
  Widget progressIndicator();
  Widget addTitle(BuildContext context, String title);
  Widget header(BuildContext context, String title);
}

mixin HomeViewWidgets implements ViewWidgets, ProductConstants {
  @override
  Center progressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsScheme.secondary,
      ),
    );
  }

  @override
  Widget addTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: ProductConstants.medFlex,
          child: Text(title, style: Theme.of(context).textTheme.headline5),
        )
      ],
    );
  }

  @override
  Widget header(BuildContext context, String title) {
    const double iconSize = 28;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: ProductConstants.medFlex,
          child: Text(title, style: Theme.of(context).textTheme.headline5),
        ),
        Expanded(
          flex: ProductConstants.lowFlex,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  const Icon(Icons.notifications_none_outlined, size: iconSize),
                  Positioned(
                    left: 5,
                    top: 6,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        borderRadius: ProjectBorderRadiusUtils.circularMax(),
                        color: ColorsScheme.gradient,
                        border: Border.all(
                          color: ColorsScheme.primary,
                          width: 0.5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Icon(Icons.history_outlined, size: iconSize),
              const Icon(Icons.settings_outlined, size: iconSize),
            ],
          ),
        ),
      ],
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xff2e2c2c),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://community.spotify.com/t5/image/serverpage/image-id/104727iC92B541DB372FBC7/image-size/large?v=v2&px=999",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Liked Songs", style: Theme.of(context).textTheme.subtitle2)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecentylPlayedReal extends StatelessWidget with HomeViewWidgets {
  const RecentylPlayedReal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 0.4],
              tileMode: TileMode.repeated,
              colors: [
                ColorsScheme.gradient,
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 8,
          right: 8,
          bottom: 0,
          child: Column(
            children: [header(context, TitlesAndSubtitles.goodEvening.getString()), const RecentlyPlayed()],
          ),
        ),
      ],
    );
  }
}
