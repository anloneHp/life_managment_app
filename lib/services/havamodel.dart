/*
class Hava {
  final String sehiradi;
  final double derece;
  final String durum;

  Hava({required this.sehiradi, required this.derece, required this.durum});

  factory Hava.fromJson(Map<String, dynamic> json) {
    return Hava(
      sehiradi: json['sehiradi'],
      derece: json['main']['derece'].toDouble(),
      durum: json['hava'][0]['main'],
    );
  }
}
*/
