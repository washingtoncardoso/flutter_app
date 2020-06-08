import 'package:desafio_framework/routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Washington Cardoso"), 
            accountEmail: Text("washington.card@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Image.asset('images/wash.jpg'),
            ),  
          ),
          ListTile(
            leading: Icon( Icons.home ),
            title: Text("Home"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          ListTile(
            leading: Icon( Icons.photo_album ),
            title: Text("Álbuns"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.albums),
          ),
          ListTile(
            leading: Icon( Icons.list ),
            title: Text("Postagens"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.post),
          ),
          ListTile(
            leading: Icon( Icons.check_box ),
            title: Text("To-dos"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.todos),
          ),
        ],
      )
    );
  }
}