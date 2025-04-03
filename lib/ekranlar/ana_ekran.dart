import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/constlar/const_string.dart';
import 'package:futbol3/ekranlar/futbol.dart';
import 'package:futbol3/ekranlar/hava.dart';
import 'package:futbol3/ekranlar/ikinci_ekran.dart';
import 'package:futbol3/ekranlar/listview.dart';
import 'package:futbol3/ekranlar/muzik.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SliderP()),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanrengi,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(ConstString.welcome),
        backgroundColor: kirmizi,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          boxTasarim(),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              children: [
                buildCard(context, 'Futbol', const Saha()),
                buildCard(context, 'Muzik', const Music()),
                buildCard(context, 'Hava', const HomeScreen()),
                //buildCard(context, 'KonumluHava', const Hava2()),
                buildCard(context, 'ListTile', const HomePage()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: arkaplanrengi,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: yesil,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ConstString.homePage,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: ConstString.cardView,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: arkaplanrengi,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Padding boxTasarim() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: 500,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: sari,
        ),
        child: const Center(
          child: Text(
            ConstString.regSt,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 23,
              color: beyaz,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String baslik, Widget sayfa) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => sayfa),
          );
        },
        child: Card(
          color: acikSari,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              baslik,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: siyah,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
