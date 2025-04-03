import 'package:flutter/material.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/coklu_dekarasyon/textfield.dart';
import 'package:futbol3/constlar/const_string.dart';
import 'package:futbol3/ekranlar/login_ekrani.dart';
import 'package:futbol3/services/database.dart';

class RegisterEkrani extends StatefulWidget {
  const RegisterEkrani({super.key});

  @override
  _RegisterEkraniState createState() => _RegisterEkraniState();
}

class _RegisterEkraniState extends State<RegisterEkrani> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _registerUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final fullname = _fullnameController.text;
    final phoneNumber = _phoneNumberController.text;

    if (username.isNotEmpty && password.isNotEmpty && fullname.isNotEmpty && phoneNumber.isNotEmpty) {
      final user = {
        'username': username,
        'password': password,
        'fullname': fullname,
        'phoneNumber': phoneNumber,
      };

      final id = await DatabaseHelper.instance.createUser(user);
      if (id != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(ConstString.kayitBasarli)),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginEkrani()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(ConstString.kayitBasarisiz)),
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
            const SizedBox(height: 50),
            _yesilBox(context),
            const SizedBox(height: 20),
            _registerMetni(),
            const SizedBox(height: 20),
            _kaydolregister(),
            const SizedBox(height: 20),
            _sifreTextfield(),
            const SizedBox(height: 20),
            _isimTextfield(),
            const SizedBox(height: 20),
            _telefonNumarasiextfield(),
            const SizedBox(height: 50),
            _registerButton(),
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
            MaterialPageRoute(builder: (context) => const LoginEkrani()),
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
            Icons.arrow_back,
            color: beyaz,
          ),
        ),
      ),
    );
  }

  Widget _registerMetni() {
    return const Text(
      ConstString.register,
      style: TextStyle(
        fontFamily: 'Urbane',
        fontSize: 60,
        color: beyaz,
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget _kaydolregister() {
    return TextFieldDecorations.textfieldDekorasyonu(
      labelText: ConstString.username,
      prefixIcon: Icons.email,
      fillColor: arkaplanrengi,
      controller: _usernameController,
    );
  }

  Widget _sifreTextfield() {
    return TextFieldDecorations.textfieldDekorasyonu(
      labelText: ConstString.sifre,
      prefixIcon: Icons.lock,
      fillColor: arkaplanrengi,
      controller: _passwordController,
      obscureText: true,
    );
  }

  Widget _isimTextfield() {
    return TextFieldDecorations.textfieldDekorasyonu(
      labelText: ConstString.isim,
      prefixIcon: Icons.person,
      fillColor: arkaplanrengi,
      controller: _fullnameController,
    );
  }

  Widget _telefonNumarasiextfield() {
    return TextFieldDecorations.textfieldDekorasyonu(
      labelText: ConstString.phoneNumber,
      prefixIcon: Icons.phone,
      fillColor: arkaplanrengi,
      controller: _phoneNumberController,
    );
  }

  Widget _registerButton() {
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
        onPressed: _registerUser,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            ConstString.register,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: beyaz,
            ),
          ),
        ),
      ),
    );
  }
}
