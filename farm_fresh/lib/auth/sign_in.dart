import 'package:flutter/material.dart';
import 'package:farm_fresh/screens/home_screens/home_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'account-sign-in-failed',
          message: 'Sign in with Google failed.',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      //Handle error
      // ignore: avoid_print
      print("Error signing in with Google: $e");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/market1.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SignInButton(
                    Buttons.googleDark,
                    text: "Sign in with Google",
                    onPressed: () {
                      signInWithGoogle().then(
                        (value) => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  const Text('By signing in you are agreeing to our'),
                  const Text('Terms and Privacy Policy'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
