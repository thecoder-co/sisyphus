import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/features/charts/providers/symbols_provider.dart';
import 'package:sisypius/resources/resources.dart';

class HomeTopCard extends ConsumerWidget {
  const HomeTopCard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 0,
        bottom: 16,
      ),
      decoration: const ShapeDecoration(
        color: Color(0xFF17181B),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF262932)),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  ref.read(symbolsProvider.notifier).updateSymbols(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImagesAssets.btcIcon,
                      height: 32,
                    ),
                    Text(
                      ref.watch(symbolsProvider).currentSymbol,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    16.spacingW,
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        SvgAssets.downArrow,
                      ),
                    ),
                  ],
                ),
              ),
              16.spacingW,
              const Text(
                '\$20,634',
                style: TextStyle(
                  color: Color(0xFF00C076),
                  fontSize: 18,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  height: 0.07,
                ),
              )
            ],
          ),
          16.spacingH,
          SizedBox(
            height: 48,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const ChangeTile(
                    topIcon: SvgAssets.clock,
                    title: '24h change',
                    body: '520.80 +1.25%',
                    bodyColor: Color(0xff00C076),
                  ),
                  divider,
                  const ChangeTile(
                    topIcon: SvgAssets.arrowUp2,
                    title: '24h high',
                    body: '520.80 +1.25%',
                  ),
                  divider,
                  const ChangeTile(
                    topIcon: SvgAssets.arrowDown2,
                    title: '24h low',
                    body: '520.80 +1.25%',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get divider => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 46,
          child: VerticalDivider(
            color: Color(0xffEAF0FE),
          ),
        ),
      );
}

class ChangeTile extends StatelessWidget {
  final String topIcon;
  final String title;
  final String body;
  final Color bodyColor;
  const ChangeTile({
    super.key,
    required this.topIcon,
    required this.title,
    required this.body,
    this.bodyColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              topIcon,
              color: const Color(0xffA7B1BC),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFFA7B1BC),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          body,
          style: TextStyle(
            color: bodyColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
