import 'package:flutter/material.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/features/home/presentation/widgets/home_bottom_card.dart';
import 'package:sisypius/features/home/presentation/widgets/home_middle_card.dart';
import 'package:sisypius/features/home/presentation/widgets/home_top_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeTopCard(),
          8.spacingH,
          const HomeMiddleCard(),
          8.spacingH,
          const HomeBottomCard(),
        ],
      ),
    );
  }
}
