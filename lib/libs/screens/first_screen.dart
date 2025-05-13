import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mon_premier_app_flutter/libs/screens/secret_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Erreur Google Sign-In: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
    setState(() {}); // Actualise l'interface
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Première Page'),
      ),
      body: Center(
        child: user == null
            ? ElevatedButton(
          onPressed: () async {
            final userCredential = await signInWithGoogle();
            if (userCredential != null) {
              setState(() {}); // Rafraîchir l'affichage
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Connecté : ${userCredential.user?.displayName ?? "inconnu"}'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connexion annulée ou échouée')),
              );
            }
          },
          child: const Text("Se connecter avec Google"),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecretPage()),
                );
              },
              child: const Text("Voir la page secrète"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: signOut,
              child: const Text("Se déconnecter"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
