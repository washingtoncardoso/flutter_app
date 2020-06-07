import 'package:desafio_framework/shared/app_drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Seja bem vindo!!!", style: TextStyle(fontSize: 25.0, color: Colors.deepPurple))
      ),
    );
  }
}