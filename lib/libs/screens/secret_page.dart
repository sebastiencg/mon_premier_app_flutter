import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // L'utilisateur n'est pas connecté → redirection ou message
      return Scaffold(
        appBar: AppBar(title: const Text("Accès refusé")),
        body: const Center(
          child: Text("Tu dois être connecté pour voir le super secret."),
        ),
      );
    }

    // Utilisateur connecté → accès au contenu
    return Scaffold(
      appBar: AppBar(title: const Text("Page Secrète")),
      body: const Center(
        child: Text(
          "🤫 Ceci est le super secret !",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
