import 'package:flutter/material.dart';
import 'package:desafio_framework/shared/app_drawer.dart';

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
        child: Container(
          child: Image.network("https://miro.medium.com/max/2438/1*VnWnqVVGNXFKZctCoB7sFg.png")
        )
      ),
    );
  }
}