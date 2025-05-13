// lib/screens/first_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThreeScreen extends StatefulWidget {
  const ThreeScreen({Key? key}) : super(key: key);

  @override
  State<ThreeScreen> createState() => _ThreeScreenState();
}

class _ThreeScreenState extends State<ThreeScreen> {
  String joke = 'Chargement...';

  @override
  void initState() {
    super.initState();
    fetchJoke();
  }

  Future<void> fetchJoke() async {
    final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        joke = data['value'];
      });
    } else {
      setState(() {
        joke = 'Erreur lors de la récupération de la blague.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Troisième Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              joke,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: fetchJoke,
              child: const Text('Nouvelle blague'),
            ),
          ],
        ),
      ),
    );
  }
}
