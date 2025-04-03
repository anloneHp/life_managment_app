/*
import 'package:flutter/material.dart';
import 'package:futbol3/services/hava.dart';

import '../services/havamodel.dart';

class Hava2 extends StatefulWidget {
  const Hava2({super.key});

  @override
  _Hava2State createState() => _Hava2State();
}

class _Hava2State extends State<Hava2> {
  final HavaServices _havaServices = HavaServices(apiKey: '46e61732a8df783e9656648950193157');
  Hava? _hava;

  _fetchHava() async {
    String sehiradi = await _havaServices.getsehiradi();

    try {
      final hava = await _havaServices.getHava(sehiradi);
      setState(() {
        _hava = hava;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchHava();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(_hava?.sehiradi ?? "Şehir yükleniyor"),
          if (_hava != null)
            Column(
              children: [
                Text('Sıcaklık: ${_hava!.derece} °C'),
                Text('Durum: ${_hava!.durum}'),
              ],
            ),
        ],
      ),
    );
  }
}
*/
