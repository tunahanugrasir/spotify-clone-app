import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

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
          SliverOverlapAbsorber(
            handle: SliverOverlapAbsorberHandle(),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: libraryViewModel.libraryModelItems.length,
              (context, index) {
                bool isPinned = libraryViewModel.libraryModelItems[index].pinned ?? false;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
                  child: SizedBox(
                    height: 75,
                    child: Card(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: context.height,
                              width: context.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      libraryViewModel.libraryModelItems[index].image ?? '',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    libraryViewModel.libraryModelItems[index].title ?? '',
                                    style:
                                        const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              isPinned ? const EdgeInsets.only(right: 4.0) : const EdgeInsets.all(0),
                                          child: Transform.rotate(
                                              angle: (240 / 360),
                                              child: isPinned
                                                  ? const Icon(
                                                      Icons.push_pin,
                                                      color: Color(0xff1DB954),
                                                      size: 18,
                                                    )
                                                  : const SizedBox()),
                                        ),
                                        Text(
                                          libraryViewModel.libraryModelItems[index].subtitle ?? '',
                                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          )
        ];
      }),
      body: const SizedBox(),
    );
  }
}
