import 'package:flutter/material.dart';
import 'package:futbol3/coklu_dekarasyon/textfield.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/constlar/const_string.dart';
import 'package:futbol3/ekranlar/ana_ekran.dart';
import 'package:futbol3/ekranlar/register_ekrani.dart';
import 'package:futbol3/services/database.dart' as db;

class LoginEkrani extends StatefulWidget {
  const LoginEkrani({super.key});

  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      final user = await db.DatabaseHelper.instance.getUser(username, password);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(ConstString.basaraliGiris)),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        // Kullanıcıyı ana sayfaya yönlendirin
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(ConstString.basarisizGiris)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(ConstString.bos)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanrengi,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            _yesilBox(context),
            const SizedBox(height: 20),
            _loginMetni(),
            const SizedBox(height: 30),
            _merhabaMetni(),
            const SizedBox(height: 30),
            _emailTextfield(),
            const SizedBox(height: 30),
            _sifreTextfield(),
            const SizedBox(height: 50),
            _girisButton(),
          ],
        ),
      ),
    );
  }

  Widget _yesilBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterEkrani()),
          );
        },
        child: Container(
          width: 43,
          height: 45,
          decoration: BoxDecoration(
            color: yesil,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: beyaz,
          ),
        ),
      ),
    );
  }

  Widget _loginMetni() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        ConstString.login,
        style: TextStyle(
          fontFamily: 'Urbane',
          fontSize: 60,
          color: beyaz,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _merhabaMetni() {
    return const Text(
      ConstString.merhaba,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    );
  }

  Widget _emailTextfield() {
    return TextFieldDecorations.textfieldDekorasyonu(
      labelText: ConstString.username,
      prefixIcon: Icons.email,
      fillColor: arkaplanrengi,
      controller: _usernameController, // Controller ekledik
    );
  }

  Widget _sifreTextfield() {
    return TextFieldDecorations.textfieldDekorasyonu(
      labelText: ConstString.sifre,
      prefixIcon: Icons.lock,
      fillColor: arkaplanrengi,
      controller: _passwordController, // Controller ekledik
      obscureText: true,
    );
  }

  Widget _girisButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: yesil,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: arkaplanrengi.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: _loginUser,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ConstString.login,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: beyaz,
                ),
              ),
              Icon(Icons.arrow_forward, color: beyaz), // Ok ikonu
            ],
          ),
        ),
      ),
    );
  }
}
