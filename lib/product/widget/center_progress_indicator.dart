import 'package:flutter/material.dart';

import '../theme/product_theme.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsScheme.secondary,
      ),
    );
  }
}
