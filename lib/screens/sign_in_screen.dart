import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey:  "AIzaSyDv0gau-i2zePQpoXHpAfxY1RRlHeyNFrc",
          appId: "1:24336856241:android:49b7cb0f744baecc4a9e90",
          messagingSenderId: "",
          projectId: "fire-goo-sign-24"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: SignInDemo(),
  ));
}

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> _handleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void _navigateToHome(User? user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in with Google'),
          onPressed: () async {
            UserCredential? userCredential = await _handleSignIn();
            if (userCredential != null) {
              print('Successfully signed in with Google: ${userCredential.user!.displayName}');
              _navigateToHome(userCredential.user);
            } else {
              print('Google Sign-In failed');
            }
          },
        ),
      ),
    );
  }
}
