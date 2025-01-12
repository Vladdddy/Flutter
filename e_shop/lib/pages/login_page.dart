import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFECEDEF),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 50.0, right: 25.0, left: 25.0),
                    child: Container(
                      height: 520,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 50.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 25.0, left: 25.0, right: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text("Email"),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'john12@gmail.com',
                                    labelStyle: TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 25.0, left: 25.0, right: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text("Password"),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'J0#n12D8hiE9!?',
                                    labelStyle: TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, left: 25.0, right: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF0088FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 50.0, left: 25.0, right: 25.0),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    Color(0xFFB2DBFF),
                                  ),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Color(0xFF0088FF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, left: 25.0, right: 25.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Do not have an account? ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Register here",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0088FF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 25.0, left: 50.0),
                        child: Divider(
                          color: Color(0xFF939393),
                        ),
                      ),
                    ),
                    Text("or", style: TextStyle(color: Color(0xFF939393))),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.0, left: 25.0),
                        child: Divider(
                          color: Color(0xFF939393),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
