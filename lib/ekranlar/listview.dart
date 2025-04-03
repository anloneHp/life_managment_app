import 'package:flutter/material.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/constlar/const_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Aktivite> aktiviteler = [
    Aktivite(aktiviteAdi: 'Spor yapmak'),
    Aktivite(aktiviteAdi: 'Müzik dinlemek'),
    Aktivite(aktiviteAdi: 'Kitap okumak'),
    Aktivite(aktiviteAdi: 'Film izlemek'),
    Aktivite(aktiviteAdi: 'Yemek yapmak'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanrengi,
      appBar: AppBar(
        title: const Text(ConstString.activites),
        backgroundColor: yesil,
      ),
      body: ListView.builder(
        itemCount: aktiviteler.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                aktiviteler[index].aktiviteAdi,
                style: TextStyle(
                  color: aktiviteler[index].isSelected ? kirmizi : siyah,
                ),
              ),
              tileColor: aktiviteler[index].isSelected ? mavi : sari,
              trailing: Checkbox(
                value: aktiviteler[index].isCompleted,
                onChanged: (bool? value) {
                  setState(() {
                    aktiviteler[index].isCompleted = value!;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  aktiviteler[index].isSelected = !aktiviteler[index].isSelected;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Aktivite {
  String aktiviteAdi;
  bool isSelected;
  bool isCompleted;

  Aktivite({required this.aktiviteAdi, this.isSelected = false, this.isCompleted = false});
}
