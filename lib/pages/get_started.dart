import 'package:flutter/material.dart';
import 'package:presence_point/pages/login.dart';
import 'package:presence_point/pages/register.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
                                    builder: (context) => Loginpage()))
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
                onPressed: () {},
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
