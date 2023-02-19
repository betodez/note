import 'dart:io';
import 'package:note_app/models/nota.dart';
import 'package:path/path.dart';
import 'package:note_app/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'NoteDB.db');

    return await openDatabase(
      path,
      version: 4,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Users(
          email TEXT PRIMARY KEY,
          pass TEXT,
          fullName TEXT
        )
      ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('''
        CREATE TABLE Notes(
          id INTEGER PRIMARY KEY,
          email TEXT,
          content TEXT
        )
      ''');
      },
    );
  }

  Future<int?> addUser(User user) async {
    final email = user.email;
    final fullName = user.fullName;
    final password = user.password;

    final db = await database;

    final res = await db?.rawInsert('''
      INSERT INTO Users(email, pass, fullName)
      VALUES('$email', '$password', '$fullName')
    ''');

    return res;
  }

  Future<User?> getUser(String email) async {
    final db = await database;
    final res =
        await db?.query('Users', where: 'email = ?', whereArgs: [email]);

    return res!.isNotEmpty
        ? User(
            email: res.first['email'].toString(),
            fullName: res.first['fullName'].toString(),
            password: res.first['pass'].toString())
        : null;
  }

  Future<int?> addNote(Nota nota) async {
    final email = nota.email;
    final contenido = nota.text;

    final db = await database;

    final res = await db?.rawInsert('''
      INSERT INTO Notes(email, content)
      VALUES('$email', '$contenido')
    ''');

    return res;
  }

  Future<List<Nota>> getNotes(String email) async {
    final db = await database;
    List<Nota> list = [];
    final res =
        await db?.query('Notes', where: 'email = ?', whereArgs: [email]);

    for (var row in res!) {
      list.add(Nota(
        id: int.parse(row['id'].toString()),
        email: row['email'].toString(),
        text: row['content'].toString(),
      ));
    }
    return list;
  }

  Future<int?> deleteNote(Nota nota) async {
    final db = await database;

    final res = await db?.rawDelete('''
      DELETE FROM Notes
      WHERE id = ${nota.id}
    ''');

    return res;
  }
}
