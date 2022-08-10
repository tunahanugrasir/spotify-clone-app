import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_app/utilities/extensions/enum_extension.dart';

import 'bottom_navigation_music_player.dart';

abstract class IPlayAndPauseIcon extends State<PlayAndPauseIcon> with TickerProviderStateMixin {
  late final AnimationController animationController;
  final String _path = AssetMusicPath.music.musicPath;
  final int _seconds = 1;
  bool _isTap = false;

  AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: _seconds));
    player.open(Audio(_path), autoStart: false, showNotification: true);
  }

  Future<void> changeAnimationAndControlMusic() async {
    setState(() {
      _musicControl();
    });
  }

  void _musicControl() {
    _isTap = !_isTap;
    if (_isTap == true) {
      animationController.forward();
      player.play();
    } else {
      animationController.reverse();
      player.pause();
    }
  }
}
