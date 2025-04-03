import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'music_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE music (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sarkici TEXT,
        sarkiIsmi TEXT
      )
    ''');
  }

  Future<int> musicEkle(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('music', row);
  }

  Future<List<Map<String, dynamic>>> queryAllMusic() async {
    Database db = await database;
    return await db.query('music');
  }

  Future<int> deleteMusic(int id) async {
    Database db = await database;
    return await db.delete('music', where: 'id = ?', whereArgs: [id]);
  }
}
