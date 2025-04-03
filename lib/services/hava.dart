/*
import 'dart:convert';

import 'package:futbol3/services/havamodel.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HavaServices {
  static const sayfa = 'https://api.openweathermap.org/data/2.5/weather';
  final dynamic apiKey;

  HavaServices({required this.apiKey});

  Future<Hava> getHava(String sehiradi) async {
    final response = await http.get(Uri.parse('$sayfa?q=$sehiradi&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Hava.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Hava Durumu alınamadı');
    }
  }

  Future<String> getsehiradi() async {
    LocationPermission izin = await Geolocator.checkPermission();
    if (izin == LocationPermission.denied) {
      izin = await Geolocator.requestPermission();
    }

    Position konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await placemarkFromCoordinates(konum.latitude, konum.longitude);

    String? sehiradi = placemarks[0].locality;

    return sehiradi ?? "";
  }
}
*/
