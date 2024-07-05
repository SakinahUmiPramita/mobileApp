import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/api/services.dart';
import 'package:mobile/forgot.dart';
import 'package:mobile/halamanutama.dart';
import 'package:mobile/register.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Login(),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> loginUser(BuildContext context) async {
      // final String apiUrl = 'http://192.168.56.155:5000/api/login';
      final response = await http.post(
        Uri.parse(AppServices.getLoginEndpoint()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Jika login berhasil, tampilkan popup "Login success"
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Success'),
            content: Text('Login successful'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => halamanutama()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Jika login gagal, tampilkan pesan error dari server
        final Map<String, dynamic> responseData = json.decode(response.body);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 33,
                top: 452,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 535,
                child: Text(
                  'Enter Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 560,
                child: Container(
                  width: 320,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0x4C6C96C5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 620,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 645,
                child: Container(
                  width: 320,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0x4C6C96C5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 62,
                top: 700,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => halamanutama()),
                    // );
                    loginUser(context);
                  },
                  child: Container(
                    width: 245.89,
                    height: 45.79,
                    decoration: ShapeDecoration(
                      color: Color(0xCC6C96C5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 63,
                top: 760,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoogleLoginPage()),
                    );
                  },
                  child: Container(
                    width: 244.20,
                    height: 41.31,
                    decoration: ShapeDecoration(
                      color: Color(0x00EA454C),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF6C96C5)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 33,
                          top: 6.33,
                          child: Container(
                            width: 28.92,
                            height: 28.92,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/google.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 67.21,
                          top: 9.16,
                          child: Text(
                            'Login with Google',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              letterSpacing: 0.42,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 820,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterApp()),
                    );
                  },
                  child: SizedBox(
                    width: 189,
                    height: 15,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFF595959),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              letterSpacing: 0.30,
                            ),
                          ),
                          TextSpan(
                            text: ' Register',
                            style: TextStyle(
                              color: Color(0xFFEA454C),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 109,
                top: 840,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgot()),
                    );
                  },
                  child: Text(
                    'Forgot your Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEA454C),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      letterSpacing: 0.30,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 106,
                child: Container(
                  width: 339,
                  height: 319,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GoogleLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login Page'),
      ),
      body: Center(
        child: Text('Welcome to Google Login Page!'),
      ),
    );
  }
}
