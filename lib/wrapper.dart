import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:presence_point/pages/get_started.dart';
import "./pages/home_page.dart";
import 'package:presence_point/pages/analytics_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(child: Text('No internet connection'));
          }
          if (!snapshot.hasData) {
            // Check if no user is logged in
            return GetStarted();
          }
          return HomePage();
        },
      ),
    );
  }
}
