import 'package:flutter/material.dart';

class forgotpassword extends StatelessWidget {
  const forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Forgotpassword(),
        ]),
      ),
    );
  }
}

class Forgotpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 41,
                top: 342,
                child: Container(
                  width: 311,
                  height: 303,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.10000000149011612),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Color(0xFF5882C1)),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 95,
                top: 548,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                    );
                  },
                  child: Container(
                    width: 195,
                    height: 48.17,
                    decoration: ShapeDecoration(
                      color: Color(0xFF6C96C5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 1,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Reset Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 101,
                top: 361,
                child: Container(
                  width: 192,
                  height: 40,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lupa Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 73,
                top: 411,
                child: Container(
                  height: 129.77,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 61,
                        child: Container(
                          width: 245,
                          height: 68.77,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0.80,
                                top: 27.46,
                                child: Container(
                                  width: 244.20,
                                  height: 41.31,
                                  decoration: ShapeDecoration(
                                    color: Color(0x00C4C4C4),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.25),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 5,
                                top: 39,
                                child: SizedBox(
                                  width: 132,
                                  height: 24,
                                  child: Text(
                                    'Enter your email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF626263),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                      letterSpacing: 0.42,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 82,
                                  height: 21,
                                  child: Text(
                                    'Your Email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF181818),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 0.42,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        top: 0,
                        child: SizedBox(
                          width: 242,
                          child: Text(
                            'Please enter your email to reset the password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF626263),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.39,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 78,
                top: 56,
                child: Container(
                  width: 242,
                  height: 279,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/242x279"),
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

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password Page'),
      ),
      body: Center(
        child: Text('Password reset link has been sent!'),
      ),
    );
  }
}
