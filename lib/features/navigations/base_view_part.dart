part of 'base_view.dart';

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
        decoration: BoxDecoration(
          color: ProductColorScheme.secondaryColor,
          borderRadius: ProjectBorderRadiusUtils.circularMax(),
        ),
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  final double _xAxis = 0;
  final double _yAxis = 0.86;
  final double _textHeight = 1.5;
  final double _letterSpacing = 0.8;

  const MusicPlayer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(_xAxis, _yAxis),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          height: context.height * 0.07,
          decoration: BoxDecoration(
            color: ProductColorScheme.musicPlayerBackgroundColor2,
            borderRadius: ProjectBorderRadiusUtils.circularLow(),
          ),
          child: Row(
            children: [
              _imageBox(),
              _textBox(context),
              const Spacer(),
              const Icon(Icons.speaker_group_outlined, color: ProductColorScheme.greyColor),
              const PlayAndPauseIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _textBox(BuildContext context) {
    return Padding(
      padding: const PaddingConstants.onlyLeft(),
      child: SizedBox(
        height: context.height / 20,
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: ProductColorScheme.secondaryColor,
              height: _textHeight,
              letterSpacing: _letterSpacing,
            ),
            children: <TextSpan>[
              TextSpan(text: ProductConstants.musicName, style: context.textTheme.bodyText1),
              TextSpan(text: ProductConstants.artistName, style: context.textTheme.bodyText2),
            ],
          ),
        ),
      ),
    );
  }

  Padding _imageBox() {
    return Padding(
      padding: const PaddingConstants.allLow(),
      child: ClipRRect(
        borderRadius: ProjectBorderRadiusUtils.circularLow(),
        child: AssetImages.currentMusic.getImage(),
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

class _PlayAndPauseIconState extends State<PlayAndPauseIcon> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isTap = false;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    player.open(Audio('assets/sounds/mutlu_ol_yeter.mp3'), autoStart: false, showNotification: true);
  }

  Future<void> changeAnimation() async {
    setState(() {
      isTap = !isTap;
      if (isTap == true) {
        _animationController.forward();
        player.play();
      } else {
        _animationController.reverse();
        player.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 10),
      child: IconButton(
          onPressed: changeAnimation,
          icon: AnimatedIcon(
            progress: _animationController,
            icon: AnimatedIcons.play_pause,
            size: 40,
          )),
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(233, 0, 0, 0), Colors.black54],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.7, 1]),
      ),
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
