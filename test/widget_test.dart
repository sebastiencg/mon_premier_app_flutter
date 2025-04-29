import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:mon_premier_app_flutter/main.dart';

void main() {
  testWidgets('Test compteur', (WidgetTester tester) async {
    // Construit l'application.
    await tester.pumpWidget(
        MaterialApp(
          home: MyHomePage(title: "Page de test"),
        )
    );

    // S'assurer que le compteur commence à zéro.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Trouver le bouton flottant et appuyer dessus.
    final button = find.byIcon(Icons.add);
    await tester.tap(button);
    await tester.pump();

    // S'assurer que le compteur a été incrémenté.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Valeur du compteur:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrémenter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
