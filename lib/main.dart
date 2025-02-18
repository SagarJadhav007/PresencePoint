import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import "./wrapper.dart";
import "./pages/login.dart";
import "./pages/home_page.dart";
import "./pages/register.dart";
import "./pages/profile.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', // Set the initial route
    routes: {
      '/': (context) => Wrapper(),
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/register': (context) => RegisterScreen(),
      '/profile': (context) => Profile(),
    },
  ));
}
