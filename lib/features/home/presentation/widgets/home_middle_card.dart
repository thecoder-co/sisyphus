import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/features/charts/presentation/candle.dart';
import 'package:sisypius/features/charts/providers/symbols_provider.dart';
import 'package:order_book/order_book.dart';

class HomeMiddleCard extends StatefulWidget {
  const HomeMiddleCard({super.key});

  @override
  State<HomeMiddleCard> createState() => _HomeMiddleCardState();
}

class _HomeMiddleCardState extends State<HomeMiddleCard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 591,
      decoration: const ShapeDecoration(
        color: Color(0xFF17181B),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF262932)),
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            16.spacingH,
            Container(
              decoration: ShapeDecoration(
                color: const Color(0xFF1C2127),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF262932)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: TabBar(
                tabs: const [
                  Tab(text: 'Charts'),
                  Tab(text: 'Orderbooks'),
                  Tab(text: 'Recent trades'),
                ],
                onTap: (v) {
                  setState(() {
                    index = v;
                  });
                },
                dividerColor: Colors.transparent,
                indicator: ShapeDecoration(
                  color: const Color(0x0CE9F0FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                indicatorPadding: const EdgeInsets.all(3),
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ).paddingSymmetric(horizontal: 16),
            Expanded(
              child: IndexedStack(
                index: index,
                children: [
                  const ChartsTab(),
                  const OrberBookTab(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrberBookTab extends ConsumerWidget {
  const OrberBookTab({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: double.infinity,
      child: OrderBookWidget(
        pair: ref.watch(symbolsProvider).currentSymbol.toLowerCase(),
        count: 10,
        loaderColor: Theme.of(context).gold,
        onClick: (value) {
          // print(value.toString());
        },
        priceWidget: const Text(
          'Price',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.start,
        ),
        volumeWidget: const Text(
          'Amount',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          textAlign: TextAlign.end,
        ),
        buyPriceStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w800, color: Colors.green),
        buyVolumeStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black87),
        sellPriceStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w800, color: Colors.red),
        sellVolumeStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black87),
      ).paddingSymmetric(horizontal: 16).paddingOnly(t: 16),
    );
  }
}
