import 'package:brutnet/Page/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrutNet',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        fontFamily: 'ProFont'
      ),
      home: const MyHomePage(title: 'Convertir Brut en Net fix'),
    );
  }
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff000000),//10%
      100: const Color(0xff000000),//20%
      200: const Color(0xff000000),//30%
      300: const Color(0xff000000),//40%
      400: const Color(0xff000000),//50%
      500: const Color(0xff000000),//60%
      600: const Color(0xff000000),//70%
      700: const Color(0xff000000),//80%
      800: const Color(0xff000000),//90%
      900: const Color(0xff000000),//100%
    },
  );
}

