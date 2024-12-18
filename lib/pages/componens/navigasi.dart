import 'package:flutter/material.dart';
import 'package:tanah_id/pages/home/home_page.dart';
import 'package:tanah_id/pages/profile/profile_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // Indeks halaman saat ini
  int _currentIndex = 0;

  // Daftar halaman
  final List<Widget> _pages = [
    const HomePage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengubah halaman aktif
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.teal[700], // Warna item aktif
        unselectedItemColor: Colors.black, // Warna item tidak aktif
        showUnselectedLabels: true,
        backgroundColor: Color(0xFF25D366),
      ),
    );
  }
}
