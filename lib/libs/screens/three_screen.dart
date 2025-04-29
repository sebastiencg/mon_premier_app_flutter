// lib/screens/first_screen.dart
import 'package:flutter/material.dart';

class ThreeScreen extends StatelessWidget {
  const ThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troisième Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Aller à la premier page'),
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
        ),
      ),
    );
  }
}
