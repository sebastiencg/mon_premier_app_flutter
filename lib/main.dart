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
      title: 'Navigation App',
      home: const HomeScreen(), // Utilise HomeScreen au lieu de routes nommées
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    FirstScreen(),
    SecondScreen(),
    ThreeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Caméra',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Réglages',
          ),
        ],
      ),
    );
  }
}
