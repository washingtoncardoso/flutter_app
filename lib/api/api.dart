import 'package:desafio_framework/models/album.model.dart';
import 'package:desafio_framework/models/post_model.dart';
import 'package:desafio_framework/models/todo.model.dart';
import 'package:desafio_framework/providers/sqlite_db_provider.dart';
import 'package:dio/dio.dart';

class Api {

  Future<List<Post>> getAllPosts() async {

    var url = "https://jsonplaceholder.typicode.com/posts";

    try {
      Response response = await Dio().get(url);

      return (response.data as List).map((post) {
        print('Inserindo posts: $post');
        SQLITEDBProvider.db.insertPost(Post.fromJson(post));
      }).toList();

    } on DioError catch (e) {
      print('Deu ruim na api posts: $e');
    }
  }

  Future<List<Album>> getAllAlbums() async {

    var url = "https://jsonplaceholder.typicode.com/albums";

    try {
      Response response = await Dio().get(url);

      return (response.data as List).map((album) {
        print('Inserindo albums: $album');
        SQLITEDBProvider.db.insertAlbum(Album.fromJson(album));
      }).toList();

    } on DioError catch (e) {
      print('Deu ruim na api albums: $e');
    }
  }

  Future<List<Todo>> getAllTodos() async {

    var url = "https://jsonplaceholder.typicode.com/todos";

    try {
      Response response = await Dio().get(url);

      return (response.data as List).map((todo) {
        print('Inserindo todos: $todo');
        SQLITEDBProvider.db.insertTodo(Todo.fromJson(todo));
      }).toList();

    } on DioError catch (e) {
      print('Deu ruim na api todos: $e');
    }
  }
}
