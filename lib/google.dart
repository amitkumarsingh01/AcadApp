import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign-In Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  Future<void> checkCurrentUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      setState(() {
        _user = user;
      });
    } catch (e) {
      print('Sign in with Google failed: $e');
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      setState(() {
        _user = null;
      });
    } catch (e) {
      print('Sign out failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_user != null) {
      // User is signed in, display profile
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_user!.photoURL!),
              ),
              SizedBox(height: 16),
              Text('Name: ${_user!.displayName}'),
              SizedBox(height: 8),
              Text('Email: ${_user!.email}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: signOut,
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      );
    } else {
      // User is not signed in, display sign-in button
      return Scaffold(
        appBar: AppBar(
          title: Text('Get Started'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: signInWithGoogle,
                icon: Icon(Icons.login),
                label: Text('Sign in with Google'),
              ),
            ],
          ),
        ),
      );
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
