import 'package:flutter/material.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/constlar/const_string.dart';
import 'package:futbol3/services/muzikdb.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  MusicEkle createState() => MusicEkle();
}

class MusicEkle extends State<Music> {
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sari,
      appBar: AppBar(
        title: const Text(ConstString.music),
        backgroundColor: kirmizi,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.queryAllMusic(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return const Center(child: Text(ConstString.notFound));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final music = snapshot.data![index];
                return ListTile(
                  title: Text(music['sarkiIsmi'] ?? ''),
                  subtitle: Text(music['sarkici'] ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      dbHelper.deleteMusic(music['id']);
                      setState(() {});
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: yesil,
        onPressed: () => _musicPencere(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _musicPencere(BuildContext context) {
    final sarkiciK = TextEditingController();
    final sarkiIsmiK = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: mavi,
        title: const Text(ConstString.addMusic),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: sarkiciK,
              decoration: const InputDecoration(labelText: ConstString.songer),
            ),
            TextField(
              controller: sarkiIsmiK,
              decoration: const InputDecoration(labelText: ConstString.song),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(ConstString.iptal),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: yesil),
            onPressed: () {
              final sarkici = sarkiciK.text.isNotEmpty ? sarkiciK.text : null;
              final sarkiIsmi = sarkiIsmiK.text.isNotEmpty ? sarkiIsmiK.text : null;
              if (sarkici != null && sarkiIsmi != null) {
                dbHelper.musicEkle({
                  'sarkici': sarkici,
                  'sarkiIsmi': sarkiIsmi,
                });
                setState(() {});
              }
              Navigator.of(context).pop();
            },
            child: const Text(ConstString.ekle),
          ),
        ],
      ),
    );
  }
}
