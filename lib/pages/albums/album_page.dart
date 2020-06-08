import 'package:desafio_framework/api/api.dart';
import 'package:desafio_framework/providers/sqlite_db_provider.dart';
import 'package:desafio_framework/shared/app_drawer.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({Key key}) : super(key: key);
  static const String routeName = "/album";

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Álbuns'),
      ),
      body: isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _buildAlbumListView(),
    );
  }

  @override
  void initState() {
    super.initState();
    // Chama o método _loadAlbumFromApi() quando o app inicializa
    _loadAlbumFromApi();
  }

  _loadAlbumFromApi() async {

    setState(() {
      isLoading = true;
    });

    var apiProvider = Api();
    await apiProvider.getAllAlbums();

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _buildAlbumListView() {
    return FutureBuilder(
      future: SQLITEDBProvider.db.getAllAlbums(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 20.0),
                ),
                title: Text(
                  "${snapshot.data[index].title}"
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(color: Colors.black12), 
            itemCount: snapshot.data.length
          );
        }
      },
    );
  }

}