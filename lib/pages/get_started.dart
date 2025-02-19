import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "./home_page.dart";
import 'package:flutter/services.dart';
import 'package:presence_point/pages/analytics_page.dart';
import 'package:presence_point/pages/login.dart';
import 'package:presence_point/pages/register.dart';
import 'package:presence_point/Auth/authentication.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
    _checkIfUserIsLoggedIn();
  }

  void _checkIfUserIsLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  Future<void> _google() async {
    try {
      UserCredential? result = await signInWithGoogle();
      if (result?.user != null) {
        // Show success message
        await _showMessageDialog(
            "Registration successful. You can now log in.");

        // Check if widget is still mounted before navigating
        if (mounted) {
          Navigator.pushReplacementNamed(context, "/home");
        }
      } else {
        // In case the sign-in result is null, handle it
        _showMessageDialog("Google Sign-In failed, please try again.");
      }
    } catch (e) {
      // Handle and display errors
      print("Error during Google Sign-In: $e");
      _showMessageDialog("Error signing in with Google: $e");
    }
  }

  Future<void> _showMessageDialog(String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Message"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ColoredBox(
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Welcome To PresencePoint",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Image(
              image: AssetImage("assets/GetStarted.png"),
              height: 300,
              width: double.infinity,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 130,
                        height: 60,
                        child: OutlinedButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()))
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 130,
                        height: 60,
                        child: OutlinedButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()))
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 300,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: _google,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                ),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/google.png'),
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 40),
                    Text(
                      "SignIn with Google",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
