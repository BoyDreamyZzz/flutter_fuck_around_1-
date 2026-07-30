import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_fuck_around/us_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.deepOrangeAccent],

              begin: Alignment.topLeft,

              end: Alignment.bottomRight,
            ),
          ),

          child: InstagramLogIn(),
        ),
      ),
    );
  }
}

class InstagramLogIn extends StatefulWidget {
  InstagramLogIn({super.key});

  @override
  State<InstagramLogIn> createState() => _InstagramLogInState();
}

class _InstagramLogInState extends State<InstagramLogIn> {
  bool visibility = true;

  bool signInState = true;

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      mainAxisAlignment: .center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),

            child: Column(
              mainAxisSize: .min,
              children: [
                Container(
                  alignment: AlignmentGeometry.center,

                  child: Image.asset(
                    'assests/imgs/Instagram-Logo.png',
                    width: 200,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),

                  child: Column(
                    children: [
                      TextField(
                        controller: _usernameController,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.5,

                              color: Colors.grey.shade300,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),

                          hintText: 'Phone number, username or email address',
                        ),
                      ),

                      SizedBox(height: 32),

                      TextField(
                        obscureText: visibility,

                        controller: _passwordController,

                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },

                            child: Icon(
                              visibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),

                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.5,

                              color: Colors.grey.shade300,
                            ),

                            borderRadius: BorderRadius.circular(10),
                          ),

                          hintText: 'Password',
                        ),
                      ),

                      Container(
                        alignment: AlignmentGeometry.centerRight,

                        child: TextButton(
                          onPressed: () {},

                          child: Text(
                            'Forgotten Password?',

                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_usernameController.text == '12' &&
                              _passwordController.text == '1') {
                            setState(() {
                              signInState = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UsChat(),
                                ),
                              );
                            });
                          } else {
                            setState(() {
                              signInState = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Incorrect username or password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight(700),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          }
                        },

                        child: Container(
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(vertical: 6),

                          margin: EdgeInsets.all(24),

                          decoration: BoxDecoration(
                            color: Colors.blue,

                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),

                          child: Text(
                            'Log in',

                            textAlign: .center,

                            style: TextStyle(
                              color: Colors.white,

                              fontSize: 20,

                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
