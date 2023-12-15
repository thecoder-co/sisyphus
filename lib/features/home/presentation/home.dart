import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/features/home/presentation/home_page.dart';
import 'package:sisypius/features/home/presentation/widgets/logomark.dart';
import 'package:sisypius/resources/resources.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        automaticallyImplyLeading: false,
        leading: const Logomark(),
        leadingWidth: 138,
        backgroundColor: const Color(0xff17181B),
        elevation: 0,
        actions: [
          Image.asset(
            ImagesAssets.avatar,
            height: 32,
            width: 32,
          ),
          16.spacingW,
          SvgPicture.asset(SvgAssets.globe),
          16.spacingW,
          SvgPicture.asset(SvgAssets.menuAlt1),
          16.spacingW,
        ],
      ),
      body: const HomePage(),
    );
  }
}
