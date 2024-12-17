import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/login_bloc.dart';
import 'package:tanah_id/helpers/user_info.dart';
import 'package:tanah_id/pages/registrasi/registrasi_page.dart';
import 'package:tanah_id/pages/home/home_page.dart';
import 'package:tanah_id/widget/warning_dialog.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isLoading = false;
//   final _emailTextboxController = TextEditingController();
//   final _passwordTextboxController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 _emailTextField(),
//                 _passwordTextField(),
//                 _buttonLogin(),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 _menuRegistrasi()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// //Membuat Textbox email
//   Widget _emailTextField() {
//     return TextFormField(
//       decoration: const InputDecoration(labelText: "Email"),
//       keyboardType: TextInputType.emailAddress,
//       controller: _emailTextboxController,
//       validator: (value) {
// //validasi harus diisi
//         if (value!.isEmpty) {
//           return 'Email harus diisi';
//         }
//         return null;
//       },
//     );
//   }

// //Membuat Textbox password
//   Widget _passwordTextField() {
//     return TextFormField(
//       decoration: const InputDecoration(labelText: "Password"),
//       keyboardType: TextInputType.text,
//       obscureText: true,
//       controller: _passwordTextboxController,
//       validator: (value) {
// //jika karakter yang dimasukkan kurang dari 6 karakter
//         if (value!.isEmpty) {
//           return "Password harus diisi";
//         }
//         return null;
//       },
//     );
//   }

// //Membuat Tombol Login
//   Widget _buttonLogin() {
//     return ElevatedButton(
//         child: const Text("Login"),
//         onPressed: () {
//           var validate = _formKey.currentState!.validate();
//           if (validate) {
//             if (!_isLoading) _submit();
//           }
//         });
//   }

  // void _submit() {
  //   _formKey.currentState!.save();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   LoginBloc.login(
  //           email: _emailTextboxController.text,
  //           password: _passwordTextboxController.text)
  //       .then((value) async {
  //     if (value.code == 200) {
  //       await UserInfo().setToken(value.token.toString());
  //       await UserInfo().setUserID(int.parse(value.userID.toString()));
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const HomePage()));
  //     } else {
  //       showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (BuildContext context) => const WarningDialog(
  //                 description: "Login gagal, silahkan coba lagi",
  //               ));
  //     }
  //   }, onError: (error) {
  //     print(error);
  //     showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (BuildContext context) => const WarningDialog(
  //               description: "Login gagal, silahkan coba lagi",
  //             ));
  //   });
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

// // Membuat menu untuk membuka halaman registrasi
  // Widget _menuRegistrasi() {
  //   return Center(
  //     child: InkWell(
  //       child: const Text(
  //         "Registrasi",
  //         style: TextStyle(color: Colors.blue),
  //       ),
  //       onTap: () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => const RegistrasiPage()));
  //       },
  //     ),
  //   );
  // }
// }


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Logo di pojok kiri atas
          Positioned(
            top: 20,
            left: 20,
            child: Image.asset(
              'assets/images/logo.png',
              height: 50, // Ukuran logo
            ),
          ),

        // Isi login di tengah layar
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _emailTextField(),
                  const SizedBox(height: 15),
                  _passwordTextField(),
                  const SizedBox(height: 25),
                  _buttonLogin(),
                  const SizedBox(height: 20),
                  _menuRegistrasi(),
                  const SizedBox(height: 20),
                  _socialLoginButtons(),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  // TextField Email
  Widget _emailTextField() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: "Email",
      filled: true,
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0), // Border radius lebih besar
        borderSide: BorderSide.none, // Hapus garis border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none, // Hapus border untuk state normal
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none, // Hapus border untuk state fokus
      ),
    ),
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0,
      color: Colors.black,
    ),
    keyboardType: TextInputType.emailAddress,
    controller: _emailTextboxController,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Email harus diisi';
      }
      return null;
    },
  );
}

  // TextField Password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Border radius lebih besar
          borderSide: BorderSide.none, // Hapus garis border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none, // Hapus border untuk state normal
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none, // Hapus border untuk state fokus
        ),
      ),
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        color: Colors.black,
      ),
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password harus diisi';
        }
        return null;
      },
    );
  }

  // Tombol Login
Widget _buttonLogin() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal[700],
      padding: const EdgeInsets.symmetric(
        horizontal: 20, // Padding horizontal agar button kecil
        vertical: 18, // Padding vertikal
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      minimumSize: const Size(0, 0), // Minimum size kecil (default)
    ),
    onPressed: () {
      var validate = _formKey.currentState!.validate();
      if (validate) {
        if (!_isLoading) _submit();
      }
    },
    child: const Text(
      "LOGIN",
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}


  // Tombol Registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don’t have an account?"),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrasiPage()));
            },
            child: const Text(
              "Create",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Tombol Login dengan Google dan Facebook
  Widget _socialLoginButtons() {
    return Column(
      children: [
        _socialButton(
          "Login With Google",
          Colors.grey[300]!,
          Icons.g_mobiledata,
        ),
        const SizedBox(height: 15),
        _socialButton(
          "Login With Facebook",
          Colors.grey[300]!,
          Icons.facebook,
        ),
      ],
    );
  }

  Widget _socialButton(String text, Color color, IconData icon) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Tambahkan aksi login sosial di sini
        },
        icon: Icon(icon, color: Colors.black),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

    void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
            email: _emailTextboxController.text,
            password: _passwordTextboxController.text)
        .then((value) async {
      if (value.code == 200) {
        await UserInfo().setToken(value.token.toString());
        await UserInfo().setUserID(int.parse(value.userID.toString()));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const WarningDialog(
                  description: "Login gagal, silahkan coba lagi",
                ));
      }
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
                description: "Login gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
  
}

