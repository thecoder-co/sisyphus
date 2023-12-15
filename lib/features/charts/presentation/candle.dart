import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:sisypius/core/utils/extensions/widget_extensions.dart';
import 'package:sisypius/features/charts/presentation/custom_candlesticks.dart';
import 'package:sisypius/features/charts/presentation/time_box.dart';
import 'package:sisypius/features/charts/providers/repository.dart';
import 'package:sisypius/features/charts/models/candle_ticker_model.dart';
import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:sisypius/features/charts/providers/symbols_provider.dart';
import 'package:sisypius/resources/resources.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartsTab extends ConsumerStatefulWidget {
  const ChartsTab({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartsTabState();
}

class _ChartsTabState extends ConsumerState<ChartsTab> {
  @override
  Widget build(BuildContext context) {
    final symbols = ref.watch(symbolsProvider);
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              16.spacingW,
              const Text(
                'Time',
                style: TextStyle(
                  color: Color(0xFFA7B1BC),
                  fontWeight: FontWeight.w500,
                ),
              ),
              for (final interval in symbols.intervals)
                TimeBox(
                  selected: interval == symbols.currentInterval,
                  title: interval,
                  onTap: () {
                    ref
                        .read(symbolsProvider.notifier)
                        .fetchCandles(symbols.currentSymbol, interval);
                  },
                ).paddingOnly(l: 4),
            ],
          ).paddingSymmetric(vertical: 16),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: const Color(0xFFA7B1BC).withOpacity(0.5),
                width: 0.5,
              ),
              bottom: BorderSide(
                color: const Color(0xFFA7B1BC).withOpacity(0.5),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
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
                  'Trading view',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              8.spacingW,
              const Text(
                'Depth',
                style: TextStyle(
                  color: Color(0xFFA7B1BC),
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.spacingW,
              SvgPicture.asset(SvgAssets.uExpandAlt),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: symbols.channel?.stream,
            builder: (context, snapshot) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ref
                    .read(symbolsProvider.notifier)
                    .updateCandlesFromSnapshot(snapshot);
              });

              return CustomCandlesticks(
                key: Key(symbols.currentSymbol + symbols.currentInterval),
                candles: symbols.candles,
                onLoadMoreCandles:
                    ref.read(symbolsProvider.notifier).loadMoreCandles,
              );
            },
          ),
        ),
      ],
    );
  }
}
