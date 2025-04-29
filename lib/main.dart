import 'package:flutter/material.dart';
import 'libs/screens/second_screen.dart';
import 'libs/screens/first_screen.dart';
import 'libs/screens/three_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes Nommées',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/three': (context) => const ThreeScreen(),

      },
    );
  }
}
