import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tableupp/db_api_connection/db_api_connection.dart';
import 'package:tableupp/model/user_data.dart';

import '../tables/available_tables.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _postalCodeController = TextEditingController();

  validateUserEmail() async {
    try {
      var response = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': _emailController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        var responseDataOfEmailValidation = jsonDecode(response.body);
        if (responseDataOfEmailValidation['emailFound']) {
          Fluttertoast.showToast(msg: "Email already registered");
        } else {
          submitAndSave();
        }
      }
    } catch (e) {
      print(e.toString);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  submitAndSave() async {
    User userModel = User(
      1,
      _emailController.text.trim(),
      _passwordController.text.trim(),
      _postalCodeController.text.trim(),
    );

    try {
      var response = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if (response.statusCode == 200)
      {

        var responseDataOfSignup = jsonDecode(response.body);

        if (responseDataOfSignup['success'])
        {
          int userId = responseDataOfSignup['user_id']; // Get user_id
          // Save user_id locally for future use
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('user_id', userId);

          Fluttertoast.showToast(msg: "Registration successful");

          setState(() {
            _emailController.clear();
            _passwordController.clear();
            _confirmPasswordController.clear();
            _postalCodeController.clear();

            Future.delayed(Duration(milliseconds: 2000), (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginScreen()),
              );
            });
          });
        } else
        {
          Fluttertoast.showToast(msg: "Error occurred, try again");
        }
      }
    } catch (e) {
      // print(e.toString);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tables/Sign up image.jpg'),
                // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'TableUPP',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    prefixIcon: const Icon(Icons.email_outlined,
                                        color: Color.fromARGB(179, 12, 11, 11)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                            .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    prefixIcon: const Icon(Icons.lock_outline,
                                        color: Color.fromARGB(179, 12, 11, 11)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Confirm password',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    prefixIcon: const Icon(Icons.lock_outlined,
                                        color: Color.fromARGB(179, 12, 11, 11)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return "Passwords don't match";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16, bottom: 8),
                                  child: Text(
                                    'Postal code',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _postalCodeController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    prefixIcon: const Icon(Icons.location_on_outlined,
                                        color: Color.fromARGB(179, 12, 11, 11)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.length < 4) {
                                      return 'Invalid postal code';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 20),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                validateUserEmail();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text.rich(
                            TextSpan(
                              text: 'By signing up, I agree to TableUPP',
                              style: TextStyle(color: Colors.white70),
                              children: [
                                TextSpan(
                                  text: 'Terms of Use',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
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
    );
  }
}
