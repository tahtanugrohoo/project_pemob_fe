import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;

  ProfilePage({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Username: $username", style: TextStyle(fontSize: 18)),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
