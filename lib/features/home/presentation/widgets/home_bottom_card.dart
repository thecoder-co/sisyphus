import 'package:flutter/material.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/features/home/presentation/widgets/buy_sell_bottomsheet.dart';

class HomeBottomCard extends StatelessWidget {
  const HomeBottomCard({super.key});

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
        length: 5,
        child: Column(
          children: [
            16.spacingH,
            Container(
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: TabBar(
                tabs: const [
                  Tab(text: 'Open Orders'),
                  Tab(text: 'Positions'),
                  Tab(text: 'Orderbooks'),
                  Tab(text: 'Orderbooks'),
                  Tab(text: 'Orderbooks'),
                ],
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicator: ShapeDecoration(
                  color: const Color(0xff21262C),
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
                tabAlignment: TabAlignment.start,
              ),
            ).paddingOnly(l: 16),
            Expanded(
              child: Center(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Open Orders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA7B1BC),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ).paddingAll(32),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  // isScrollControlled: true,
                  builder: (context) => const BuySellBottomSheet(),
                );
              },
              child: Container(
                width: double.infinity,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: const ShapeDecoration(
                  color: Color(0xFF262B31),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xFF262932),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF25C26E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Buy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                            height: 0.12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF5449),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Sell',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                            height: 0.12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
