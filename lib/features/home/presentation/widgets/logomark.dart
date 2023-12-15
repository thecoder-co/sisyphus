import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/resources/resources.dart';

class Logomark extends StatelessWidget {
  const Logomark({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        16.spacingW,
        SvgPicture.asset(
          SvgAssets.logomark,
        ),
        10.spacingW,
        SvgPicture.asset(
          SvgAssets.logotype,
        )
      ],
    );
  }
}
