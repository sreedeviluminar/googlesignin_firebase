import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googlesignin_firebase/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user!.displayName}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInDemo(),
                  ),
                );
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
