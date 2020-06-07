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
              child: Image.network("https://avatars3.githubusercontent.com/u/60671227?s=460&u=2c17b5112a8fdfdebe880a93313a35d614e75174&v=4"),
            ),  
          ),
          ListTile(
            leading: Icon( Icons.home ),
            title: Text("Home"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          ListTile(
            leading: Icon( Icons.photo_album ),
            title: Text("Albums"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.albums),
          ),
          ListTile(
            leading: Icon( Icons.list ),
            title: Text("Posts"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.post),
          ),
          ListTile(
            leading: Icon( Icons.check_box ),
            title: Text("Todos"),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.todos),
          ),
        ],
      )
    );
  }
}