import "package:firebase_auth/firebase_auth.dart";
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}

Future<void> createUserWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

// Google Sign-In
Future<UserCredential?> signInWithGoogle() async {
  try {
    print("Starting Google Sign-In...");

    // Step 1: Trigger Google Sign-In
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      print("Google Sign-In was cancelled.");
      return null; // User canceled the sign-in
    }

    // Step 2: Authenticate with Google
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    if (googleAuth.accessToken == null || googleAuth.idToken == null) {
      print("Google Sign-In authentication failed.");
      return null; // If token is null, sign-in failed
    }

    // Step 3: Get Firebase credentials
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Step 4: Sign in with Firebase using the Google credential
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    print("Google Sign-In success: ${userCredential.user?.uid}");
    return userCredential;
  } catch (e) {
    print("Google Sign-In error: $e");
    return null;
  }
}

// Logout from Google
Future<void> signOutWithGoogle() async {
  try {
    await _googleSignIn.signOut();
    await _auth.signOut();
  } catch (e) {
    print('Error signing out of Google: $e');
  }
}
