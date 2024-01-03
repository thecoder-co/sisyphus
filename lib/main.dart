import 'package:sisypius/features/home/presentation/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
        ..textTheme.apply(
          fontFamily: 'Satoshi',
        )
        ..copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff17181B),
            elevation: 0,
          ),
          scaffoldBackgroundColor: const Color(0xff1C2127),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xff1C2127),
            secondary: Color(0xff1C2127),
          ).copyWith(
            background: const Color(0xff1C2127),
          ),
          dividerColor: const Color(0xFFA7B1BC),
        ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
