import 'package:flutter/material.dart';
import 'package:tanah_id/helpers/user_info.dart';
import 'package:tanah_id/pages/login/login_page.dart';
import 'package:tanah_id/pages/profile/profile_page.dart';
import 'package:tanah_id/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   Widget page = const CircularProgressIndicator();
//   @override
//   void initState() {
//     super.initState();
//     isLogin();
//   }

//   void isLogin() async {
//     var token = await UserInfo().getToken();
//     if (token != null) {
//       setState(() {
//         page = const HomePage();
//       });
//     } else {
//       setState(() {
//         page = const ProfileScreen();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tanah Id',
//       debugShowCheckedModeBanner: false,
//       home: page,
//     );
//   }
// }



class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  Widget page = const LoginPage();

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const HomePage();
      });
    } else {
      setState(() {
        page = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tanah Id',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // Warna item aktif
          unselectedItemColor: Colors.black, // Warna item tidak aktif
          showUnselectedLabels: true,
          backgroundColor: Color(0xFF25D366),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}