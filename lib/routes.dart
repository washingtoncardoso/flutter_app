import 'package:desafio_framework/pages/albums/album_page.dart';
import 'package:desafio_framework/pages/post/post_page.dart';

import 'package:desafio_framework/pages/todos/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:desafio_framework/pages/home/home_page.dart';

class Routes {
  static const String home = HomePage.routeName;
  static const String albums = AlbumPage.routeName;
  static const String post = PostPage.routeName;
  static const String todos = TodoPage.routeName;

  static getRoutes(BuildContext context) {
    return { 
      home: (context) => HomePage(),
      albums: (context) => AlbumPage(), 
      post: (context) => PostPage(), 
      todos: (context) => TodoPage(),  
    };
  }
}