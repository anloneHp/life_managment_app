import 'package:flutter/material.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/constlar/const_string.dart';
import 'package:futbol3/services/futboldb.dart';

class Saha extends StatefulWidget {
  const Saha({super.key});

  @override
  _SahaState createState() => _SahaState();
}

class _SahaState extends State<Saha> {
  List<Map<String, dynamic>> oyuncular = [];
  Map<String, String?> pozisyonlar = {
    'KL': null,
    'SB': null,
    'STP': null,
    'SĞB': null,
    'ORT': null,
    'SA': null,
    'ST': null,
    'RKL': null,
    'RSB': null,
    'RSTP': null,
    'RSĞB': null,
    'RORT': null,
    'RSAR': null,
    'RSOR': null,
    'RST': null,
  };

  @override
  void initState() {
    super.initState();
    _loadoyuncular();
  }

  void _loadoyuncular() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    List<Map<String, dynamic>> alloyuncular = await helper.queryAllRows();
    setState(() {
      oyuncular = alloyuncular;
    });
  }

  void _addPlayer() {
    showDialog(
      context: context,
      builder: (context) {
        String oyuncuAdi = '';
        return AlertDialog(
          title: const Text(ConstString.oyuncuekle),
          backgroundColor: mavi,
          content: TextField(
            onChanged: (value) {
              oyuncuAdi = value;
            },
            decoration: const InputDecoration(hintText: ConstString.oyuncuekle, hintStyle: TextStyle(color: beyaz)),
          ),
          actions: [
            TextButton(
              child: const Text(ConstString.iptal),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(ConstString.ekle),
              onPressed: () async {
                DatabaseHelper helper = DatabaseHelper.instance;
                await helper.insert({
                  'name': oyuncuAdi,
                  'position': 'default', // Bu pozisyon verisi değiştirilebilir
                });
                Navigator.of(context).pop();
                _loadoyuncular();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearField() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    for (var player in oyuncular) {
      await helper.delete(player['_id']);
    }
    setState(() {
      oyuncular = [];
      pozisyonlar = {
        'KL': null,
        'SB': null,
        'STP': null,
        'SĞB': null,
        'ORT': null,
        'SA': null,
        'ST': null,
        'RKL': null,
        'RSB': null,
        'RSTP': null,
        'RSĞB': null,
        'RORT': null,
        'RSAR': null,
        'RSOR': null,
        'RST': null,
      };
    });
  }

  void _updatePlayerPosition(String position, String? oyuncuAdi) {
    setState(() {
      pozisyonlar[position] = oyuncuAdi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstString.sahaniz),
        backgroundColor: kirmizi,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addPlayer,
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearField,
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset('assets/field.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
            ..._buildPositionDropdowns()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPositionDropdowns() {
    return [
      _buildPositionedDropdown('KL', 20, 180),
      _buildPositionedDropdown('SL', 150, 20),
      _buildPositionedDropdown('CB1', 120, 100),
      _buildPositionedDropdown('CB2', 120, 220),
      _buildPositionedDropdown('SĞB', 150, 320),
      _buildPositionedDropdown('DEF', 280, 80),
      _buildPositionedDropdown('DEF', 280, 250),
      _buildPositionedDropdown('SL', 500, 30),
      _buildPositionedDropdown('OOF', 450, 180),
      _buildPositionedDropdown('SĞ', 500, 300),
      _buildPositionedDropdown('ST', 550, 180),
    ];
  }

  Widget _buildPositionedDropdown(String position, double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: DropdownButton<String>(
        hint: Text(
          position,
          style: const TextStyle(
            color: sari,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: pozisyonlar[position],
        items: oyuncular.map((player) {
          return DropdownMenuItem<String>(
            value: player['name'],
            child: Text(player['name']),
          );
        }).toList(),
        onChanged: (value) {
          _updatePlayerPosition(position, value);
        },
        dropdownColor: siyah,
        style: const TextStyle(
          color: kirmizi,
          fontWeight: FontWeight.bold,
        ),
        iconEnabledColor: beyaz,
      ),
    );
  }
}
