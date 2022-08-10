import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../features/features_index.dart';
import '../product_index.dart';
import '../../core/models/bottom_navigation_model.dart';
import '../../utilities/extensions/enum_extension.dart';
import 'bottom_navigation_music_player_part.dart';

class BottomNavigationAndMusicPlayer extends StatelessWidget {
  const BottomNavigationAndMusicPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: const [
        BaseBottomBar(),
        MusicPlayer(),
        MusicProgression(),
      ],
    );
  }
}

class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ProductTheme.baseBottomBoxDecoration,
      child: BottomNavigationBar(
        currentIndex: context.watch<BaseViewModel>().selectedTab,
        onTap: (int value) {
          context.read<BaseViewModel>().selectedTabChange(value);
        },
        items: BottomNavigationListModel().toWidgets(),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with MusicPlayerVariables {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(xAxis, yAxis),
      child: Padding(
        padding: const PaddingUtils.horizontalSymmetricTree(),
        child: Container(
          height: context.height * 0.07,
          decoration: ProductTheme().musicPlayerBoxDecoration,
          child: Row(
            children: [
              _imageBox(),
              _textBox(context),
              const Spacer(),
              _iconButtonAndBottomSheetView(context),
              const PlayAndPauseIcon(),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _iconButtonAndBottomSheetView(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: ColorsScheme.transparent,
              builder: (context) {
                return const BottomSheetModel();
              });
        },
        icon: const Icon(Icons.speaker_group_outlined, color: ColorsScheme.grey));
  }

  Padding _textBox(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.onlyLeft(),
      child: SizedBox(
        height: context.height / 20,
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: ColorsScheme.secondary,
              height: textHeight,
              letterSpacing: letterSpacing,
            ),
            children: <TextSpan>[
              TextSpan(text: BottomNavigationBarUtils().musicName, style: context.textTheme.bodyText1),
              TextSpan(text: BottomNavigationBarUtils().artistName, style: context.textTheme.bodyText2),
            ],
          ),
        ),
      ),
    );
  }

  Padding _imageBox() {
    return Padding(
      padding: const PaddingUtils.allLow(),
      child: ClipRRect(
        borderRadius: ProjectBorderRadiusUtils.circularLow(),
        child: AssetImages.currentMusic.getImage(),
      ),
    );
  }
}

class MusicProgression extends StatelessWidget {
  const MusicProgression({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.width / 3,
      left: context.width * 0.04,
      bottom: context.height * 0.064,
      child: Container(
        height: context.height * 0.003,
        width: context.width,
        decoration: ProductTheme().musicProgressionBoxDecoration,
      ),
    );
  }
}

class PlayAndPauseIcon extends StatefulWidget {
  const PlayAndPauseIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayAndPauseIcon> createState() => _PlayAndPauseIconState();
}

class _PlayAndPauseIconState extends IPlayAndPauseIcon {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingUtils.playPauseIcon(),
      child: IconButton(
          onPressed: changeAnimationAndControlMusic,
          icon: AnimatedIcon(
            progress: animationController,
            icon: AnimatedIcons.play_pause,
            size: IconUtils.bottomBarIconSize,
          )),
    );
  }
}
