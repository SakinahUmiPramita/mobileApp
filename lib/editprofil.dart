import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class EditProfile extends StatefulWidget {
  final String? initialEmail;
  final String? initialNama;
  final String? initialImagePath;

  const EditProfile({
    Key? key,
    this.initialEmail,
    this.initialNama,
    this.initialImagePath,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  String? selectedImageUrl;

  @override
  void initState() {
    super.initState();
    emailController.text = widget.initialEmail ?? "";
    namaController.text = widget.initialNama ?? "";
    selectedImageUrl = widget.initialImagePath; // Initial image URL if available
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: const Color(0x4C6C96C5),
        title: const Text(
          'Ubah Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _saveChanges,
            icon: const Icon(Icons.save, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AvatarGlow(
                endRadius: 110,
                glowColor: Colors.black,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0x4C6C96C5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: selectedImageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            selectedImageUrl!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: namaController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Nama",
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text(
                  "Pilih Gambar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x4C6C96C5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  minimumSize: const Size(100, 50),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text(
                  "UBAH",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x4C6C96C5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  minimumSize: const Size(100, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage() {
  final html.FileUploadInputElement input = html.FileUploadInputElement();
  input.accept = 'image/*';
  input.click(); // Menampilkan dialog pilih file

  input.onChange.listen((event) {
    final files = input.files;
    if (files!.isEmpty) return;
    final reader = html.FileReader();
    reader.readAsDataUrl(files[0]);

    reader.onLoadEnd.listen((loadEndEvent) {
      setState(() {
        // Simpan URL gambar yang dipilih atau lakukan sesuai kebutuhan
        selectedImageUrl = reader.result as String?;
        });
      });
    });
  }

  void _saveChanges() {
    print("Saving changes...");
    print("Email: ${emailController.text}");
    print("Nama: ${namaController.text}");
    print("Image URL: $selectedImageUrl");
    Navigator.pop(context, {
      'email': emailController.text,
      'nama': namaController.text,
      'selectedImagePath': selectedImageUrl,
    });
  }
}
