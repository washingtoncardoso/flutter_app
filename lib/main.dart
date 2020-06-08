import 'package:desafio_framework/pages/home/home_page.dart';
import 'package:desafio_framework/routes.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.getRoutes(context),
      initialRoute: HomePage.routeName,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}