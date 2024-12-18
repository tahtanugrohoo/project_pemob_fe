import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/logout_bloc.dart';
import 'package:tanah_id/pages/profile/profile_form.dart';
import 'package:tanah_id/pages/login/login_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "Jefri_nichol";
  String fullName = "Jefri Nichol";
  String email = "jefri@gmail.com";
  String phoneNumber = "08123456789";
  String address = "Purbalingga";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Jefri',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ProfileItem(title: 'Username', value: username),
            ProfileItem(title: 'Nama Lengkap', value: fullName),
            ProfileItem(title: 'Email', value: email),
            ProfileItem(title: 'Nomor HP', value: phoneNumber),
            ProfileItem(title: 'Alamat', value: address),
            const SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.center, // Posisi di tengah
            children: [
              // Tombol Edit Profile
              _editProfile(context),
              const SizedBox(width: 20), // Spasi antara tombol
              // Tombol Logout
              _buttonLogout(),
            ],
          ),
          const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _editProfile(BuildContext context) {
  String username = "Jefri_nichol";
  String fullName = "Jefri Nichol";
  String email = "jefri@gmail.com";
  String phoneNumber = "08123456789";
  String address = "Purbalingga";

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal[700],
      padding: const EdgeInsets.symmetric(
        horizontal: 20, // Padding horizontal agar button kecil
        vertical: 18, // Padding vertikal
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      minimumSize: const Size(0, 0), // Minimum size kecil (default)
    ),
    onPressed: () {
      // Navigasi ke halaman Edit Profil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfileScreen(
            username: username,
            fullName: fullName,
            email: email,
            phoneNumber: phoneNumber,
            address: address,
          ), // Ganti dengan halaman Edit Profil
        ),
      );
    },
    child: const Text(
      "Edit Profil",
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buttonLogout() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal[700],
      padding: const EdgeInsets.symmetric(
        horizontal: 20, // Padding horizontal agar button kecil
        vertical: 18, // Padding vertikal
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      minimumSize: const Size(0, 0), // Minimum size kecil (default)
    ),
    onPressed: () {
      
    },
    child: const Text(
      "LOGOUT",
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
