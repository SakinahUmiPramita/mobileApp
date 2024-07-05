import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'editprofil.dart'; // Assuming EditProfile is defined in editprofil.dart
import 'login.dart'; // Assuming Login is defined in login.dart

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = "nabillaaz012@gmail.com";
  String nama = "Nabilla Auly Zahra";
  String? profileImagePath; // Path untuk gambar profil

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: const Color(0x4C6C96C5),
                        shape: BoxShape.circle,
                      ),
                      child: profileImagePath != null &&
                              File(profileImagePath!).existsSync()
                          ? ClipOval(
                              child: Image.file(
                                File(profileImagePath!),
                                fit: BoxFit.cover,
                              ),
                            )
                          : const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profil.png"),
                              radius: 85,
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        PageTransition(
                          child: EditProfile(
                            initialEmail: email,
                            initialNama: nama,
                            initialImagePath: profileImagePath,
                          ),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );

                      if (result != null && result is Map<String, dynamic>) {
                        setState(() {
                          email = result['email'] ?? email;
                          nama = result['nama'] ?? nama;
                          profileImagePath =
                              result['selectedImagePath'] ?? profileImagePath;
                          print(
                              "Updated Profile Image Path: $profileImagePath");
                        });
                      }
                    },
                    leading: const Icon(Icons.person),
                    title: const Text(
                      "Ubah Profile",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: Login(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "SerenitySOS",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
