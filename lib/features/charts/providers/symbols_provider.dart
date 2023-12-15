import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisypius/core/services/services.dart';
import 'package:sisypius/features/charts/models/candle_ticker_model.dart';
import 'package:sisypius/features/charts/presentation/search_symbols.dart';
import 'package:sisypius/features/charts/providers/repository.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final symbolsProvider =
    StateNotifierProvider<SymbolsNotifier, SymbolsService>((ref) {
  return SymbolsNotifier(ref, SymbolsService());
});

class SymbolsNotifier extends StateNotifier<SymbolsService> {
  final Ref ref;
  final SymbolsService repo;

  SymbolsNotifier(this.ref, this.repo) : super(SymbolsService()) {
    refreshData();
  }

  void refreshData() async {
    fetchSymbols();
  }

  void fetchSymbols() async {
    final res = await state.fetchSymbols();
    state = state.copyWith(
      symbols: res,
    );
    if (state.symbols.isNotEmpty) {
      fetchCandles(state.symbols[0], state.currentInterval);
    }
  }

  Future<void> fetchCandles(String symbol, String interval) async {
    // close current channel if exists
    if (state.channel != null) {
      state.channel!.sink.close();
      state.channel = null;
    }
    // clear last candle list
    state = state.copyWith(candles: [], currentInterval: interval);

    try {
      // load candles info
      final data = await state.repository
          .fetchCandles(symbol: symbol, interval: interval);
      // connect to binance stream
      state.channel = state.repository
          .establishConnection(symbol.toLowerCase(), state.currentInterval);
      // update candles
      state = state.copyWith(
        candles: data,
        currentSymbol: symbol,
        currentInterval: interval,
      );
    } catch (e) {
      // handle error
      return;
    }
  }

  void updateCandlesFromSnapshot(AsyncSnapshot<Object?> snapshot) {
    if (state.candles.isEmpty) return;
    if (snapshot.data != null) {
      final map = jsonDecode(snapshot.data as String) as Map<String, dynamic>;
      if (map.containsKey("k") == true) {
        final candleTicker = CandleTickerModel.fromJson(map);

        // cehck if incoming candle is an update on current last candle, or a new one
        if (state.candles[0].date == candleTicker.candle.date &&
            state.candles[0].open == candleTicker.candle.open) {
          // update last candle
          state.candles[0] = candleTicker.candle;
          state = state.copyWith();
        }
        // check if incoming new candle is next candle so the difrence
        // between times must be the same as last existing 2 state.candles
        else if (candleTicker.candle.date.difference(state.candles[0].date) ==
            state.candles[0].date.difference(state.candles[1].date)) {
          // add new candle to list
          state.candles.insert(0, candleTicker.candle);
          state = state.copyWith();
        }
      }
    }
  }

  Future<void> loadMoreCandles() async {
    try {
      // load candles info
      final data = await state.repository.fetchCandles(
        symbol: state.currentSymbol,
        interval: state.currentInterval,
        endTime: state.candles.last.date.millisecondsSinceEpoch,
      );
      state.candles.removeLast();
      state.candles.addAll(data);
      state = state.copyWith();
    } catch (e) {
      // handle error
      return;
    }
  }

  void updateSymbols(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return SymbolsSearchModal(
          symbols: state.symbols,
          onSelect: (value) {
            fetchCandles(value, state.currentInterval);
          },
        );
      },
    );
  }
}

class SymbolsService {
  List<String> symbols;
  String currentSymbol;

  List<Candle> candles;
  WebSocketChannel? channel;
  String currentInterval;
  final intervals = [
    '1m',
    '3m',
    '5m',
    '15m',
    '30m',
    '1h',
    '2h',
    '4h',
    '6h',
    '8h',
    '12h',
    '1d',
    '3d',
    '1w',
    '1M',
  ];

  SymbolsService({
    this.symbols = const [],
    this.currentSymbol = "",
    this.candles = const [],
    this.channel,
    this.currentInterval = "1m",
  });

  BinanceRepository repository = BinanceRepository();
  final BackendService _apiService = BackendService(Dio());

  //copyWith
  SymbolsService copyWith({
    List<String>? symbols,
    String? currentSymbol,
    List<Candle>? candles,
    WebSocketChannel? channel,
    String? currentInterval,
  }) {
    return SymbolsService(
      symbols: symbols ?? this.symbols,
      currentSymbol: currentSymbol ?? this.currentSymbol,
      candles: candles ?? this.candles,
      channel: channel ?? this.channel,
      currentInterval: currentInterval ?? this.currentInterval,
    );
  }

  Future<List<String>> fetchSymbols() async {
    try {
      // load candles info
      final data = await repository.fetchSymbols();
      return data;
    } catch (e) {
      // handle error
      return [];
    }
  }
}
