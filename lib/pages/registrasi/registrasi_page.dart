import 'package:flutter/material.dart';
import 'package:tanah_id/bloc/registrasi_bloc.dart';
import 'package:tanah_id/pages/login/login_page.dart';
import 'package:tanah_id/widget/success_dialog.dart';
import 'package:tanah_id/widget/warning_dialog.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _alamatController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                      'REGISTRASI',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _usernameTextField(),
                    const SizedBox(height: 15),
                    _emailTextField(),
                    const SizedBox(height: 15),
                    _alamatTextField(),
                    const SizedBox(height: 15),
                    _passwordTextField(),
                    const SizedBox(height: 15),
                    _confirmPasswordTextField(),
                    const SizedBox(height: 20),
                    _menuRegistrasi(),
                    const SizedBox(height: 25),
                    _buttonRegistrasi(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // TextField Username
  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      controller: _usernameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Username harus diisi';
        }
        return null;
      },
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
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        //validasi harus diisi
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }
        //validasi email
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0 - 9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zAZ]{2,}))$';
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return "Email tidak valid";
        }
        return null;
      },
    );
  }

  // TextField Alamat
  Widget _alamatTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Alamat",
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      controller: _alamatController,
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Alamat harus diisi';
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
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password harus diisi';
        }
        return null;
      },
    );
  }

  // TextField Confirm Password
  Widget _confirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true,
      controller: _confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Konfirmasi Password harus diisi';
        }
        if (value != _passwordController.text) {
          return 'Password tidak cocok';
        }
        return null;
      },
    );
  }

  Widget _menuRegistrasi() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an acoount?"),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage()));
            },
            child: const Text(
              "Login",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  //Membuat Tombol Registrasi
  Widget _buttonRegistrasi() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[700],
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        "REGISTER",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) _submit();
        }
      },
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    RegistrasiBloc.registrasi(
      username: _usernameController.text,
      email: _emailController.text,
      alamat: _alamatController.text,
      password: _passwordController.text,
    ).then((value) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => SuccessDialog(
          description: "Registrasi berhasil, silahkan login",
          okClick: () {
            Navigator.pop(context);
            Navigator.pop(context); // Kembali ke halaman login
          },
        ),
      );
    }, onError: (error) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const WarningDialog(
          description: "Registrasi gagal, silahkan coba lagi",
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }
}
