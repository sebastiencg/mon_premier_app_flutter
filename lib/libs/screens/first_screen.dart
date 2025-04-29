// lib/screens/first_screen.dart
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troisième Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Aller à la Première page'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        child: ElevatedButton(
          child: const Text('Aller à la Première page'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
