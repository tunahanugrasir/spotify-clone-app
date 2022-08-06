import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../utilities/project_utils.dart';
import '../constants/product_constants.dart';
import '../theme/product_theme.dart';

class GenreCards extends StatelessWidget {
  final String genreName;
  final String genreImageURL;
  final Color backgroundColor;
  const GenreCards({Key? key, required this.genreName, required this.genreImageURL, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Row(
        children: [
          _textArea(),
          _imageArea(context),
        ],
      ),
    );
  }

  Expanded _imageArea(BuildContext context) {
    return Expanded(
      flex: ProductConstants.medFlex,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            SingleChildScrollView(
              padding: const PaddingConstants.genreImage(),
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation(ProductConstants.rotateValue),
                    child: Image.network(
                      genreImageURL,
                      fit: BoxFit.cover,
                      height: context.height * 0.095,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _textArea() {
    return Expanded(
      flex: ProductConstants.maxFlex,
      child: Column(
        children: [
          Padding(
            padding: const PaddingConstants.normal(),
            child: Text(
              genreName,
              style: ProductTheme.textTheme.headline6,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
