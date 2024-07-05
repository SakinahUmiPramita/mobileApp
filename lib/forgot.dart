import 'package:flutter/material.dart';


class forgot extends StatelessWidget {
  const forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: const [
            Forgot(),
          ],
        ),
      ),
    );
  }
}

class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Column(
      children: [
        const SizedBox(height: 96),
        Container(
          width: 334,
          height: 334,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/forgot.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 40),
        const Text(
          'Lupa Password',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 29,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 40),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password Lama',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0x4C6C96C5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: oldPasswordController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password Baru',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0x4C6C96C5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: newPasswordController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Konfirmasi Password',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0x4C6C96C5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            // Handle the password reset logic here
            String oldPassword = oldPasswordController.text;
            String newPassword = newPasswordController.text;
            String confirmPassword = confirmPasswordController.text;
            // Perform validation and password reset operation
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xCC6C96C5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
