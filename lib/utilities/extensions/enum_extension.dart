import 'package:flutter/material.dart';

enum AssetImages { currentMusic }

extension ImagesAddPath on AssetImages {
  String addPath() {
    switch (this) {
      case AssetImages.currentMusic:
        return 'assets/images/ic_current_music.jpg';
    }
  }

  Widget getImage() {
    return Image.asset(addPath());
  }
}
