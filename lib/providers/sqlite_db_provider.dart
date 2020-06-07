import 'dart:io';
import 'package:desafio_framework/models/album.model.dart';
import 'package:desafio_framework/models/post_model.dart';
import 'package:desafio_framework/models/todo.model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class SQLITEDBProvider {
  static Database _database;
  static final SQLITEDBProvider db = SQLITEDBProvider._();

  SQLITEDBProvider._();

  Future<Database> get database async {
    
    // Se exite banco retorna banco
    if (_database != null) return _database;

    // Se não existe cria um
    _database = await initDB();

    return _database;
  }

  // Cria banco e as tabelas
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'blog.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Post('
          'userId,'
          'id INTEGER PRIMARY KEY,'
          'title TEXT,'
          'body TEXT'
          ')');
        await db.execute('CREATE TABLE Album('
          'userId,'
          'id INTEGER PRIMARY KEY,'
          'title TEXT'
          ')');
        await db.execute('CREATE TABLE Todo('
          'userId,'
          'id INTEGER PRIMARY KEY,'
          'title TEXT,'
          'completed TEXT'
          ')');
      });
  }

  // Inseri post no banco
  insertPost(Post newPost) async {
    await deleteAllPosts();
    final db = await database;
    final res = await db.insert('Post', newPost.toJson());

    return res;
  }

  // Deleta todos os posts
  Future<int> deleteAllPosts() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Post');

    return res;
  }

  // Pega todos os posts
  Future<List<Post>> getAllPosts() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM POST");

    List<Post> list = res.isNotEmpty ? res.map((c) => Post.fromJson(c)).toList() : [];

    return list;
  }

  // Inseri album no banco
  insertAlbum(Album newAlbum) async {
    await deleteAllAlbums();
    final db = await database;
    final res = await db.insert('Album', newAlbum.toJson());

    return res;
  }

  // Deleta todos os albums
  Future<int> deleteAllAlbums() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Album');

    return res;
  }

  // Pega todos os albums
  Future<List<Album>> getAllAlbums() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM ALBUM");

    List<Album> list = res.isNotEmpty ? res.map((c) => Album.fromJson(c)).toList() : [];

    return list;
  }

  // Inseri todo no banco
  insertTodo(Todo newTodo) async {
    await deleteAllTodos();
    final db = await database;
    final res = await db.insert('Todo', newTodo.toJson());

    return res;
  }

  // Deleta todos os todos
  Future<int> deleteAllTodos() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Todo');

    return res;
  }

  // Pega todos os todos
  Future<List<Todo>> getAllTodos() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM TODO");

    List<Todo> list = res.isNotEmpty ? res.map((c) => Todo.fromJson(c)).toList() : [];

    return list;
  }


}