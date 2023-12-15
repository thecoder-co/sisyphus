import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/resources/resources.dart';
import 'package:sisypius/router/route/app_routes.dart';

class BuySellBottomSheet extends StatelessWidget {
  const BuySellBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 28,
      ),
      decoration: const ShapeDecoration(
        color: Color(0xFF20252B),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF262932)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.all(2),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.1599999964237213),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF21262C),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF25C26E),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 1,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Text(
                        'Buy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 6),
                      child: const Text(
                        'Sell',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFA7B1BC),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            18.spacingH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF353945),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    'Limit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Text(
                  'Market',
                  style: TextStyle(
                    color: Color(0xFFA7B1BC),
                    fontSize: 14,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
                const Text(
                  'Stop-Limit',
                  style: TextStyle(
                    color: Color(0xFFA7B1BC),
                    fontSize: 14,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ],
            ),
            16.spacingH,
            const CustomTextField(
                hintText: '0.00 USD', prefixText: 'Limit price'),
            16.spacingH,
            const CustomTextField(hintText: '0.00 USD', prefixText: 'Amount'),
            16.spacingH,
            const CustomTextField(
                hintText: 'Good till cancelled', prefixText: 'Type'),
            16.spacingH,
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1C2127),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF373B3F)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                8.spacingW,
                const Text(
                  'Post Only',
                  style: TextStyle(
                    color: Color(0xFFA7B1BC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.spacingW,
                SvgPicture.asset(
                  SvgAssets.uInfoCircle,
                ),
              ],
            ),
            16.spacingH,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: Color(0xFFA7B1BC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '0.00',
                  style: TextStyle(
                    color: Color(0xFFA7B1BC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            16.spacingH,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(1.00, -0.00),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0xFF483BEB),
                    Color(0xFF7847E1),
                    Color(0xFFDD568D)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Center(
                child: Text(
                  'Buy BTC',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            15.spacingH,
            const Divider(
              height: 1,
              color: Color(0xff394047),
            ),
            15.spacingH,
            orderTab(
              title: 'Total account value',
              titleSub: 'NGN',
              showSub: false,
            ),
            16.spacingH,
            orderTab(
              title: 'Open Orders',
              titleSub: 'Available',
              showSub: true,
            ),
            32.spacingH,
            InkWell(
              onTap: () {
                pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF2764FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Deposit',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ).alignLeft,
          ],
        ),
      ),
    );
  }

  @widgetFactory
  Widget orderTab({
    required String title,
    required String titleSub,
    required bool showSub,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFFA7B1BC),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.spacingH,
            const Text(
              '0.00',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              titleSub,
              style: const TextStyle(
                color: Color(0xFFA7B1BC),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.spacingH,
            if (showSub)
              const Text(
                '0.00',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                ),
              )
          ],
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String prefixText;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                prefixText,
                style: const TextStyle(
                  color: Color(0xFFA7B1BC),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.spacingW,
              SvgPicture.asset(
                SvgAssets.uInfoCircle,
              ),
            ],
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFA7B1BC),
          fontSize: 12,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
          height: 0.17,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xff373B3F),
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xff373B3F),
              width: 1,
            )),
      ),
    );
  }
}
