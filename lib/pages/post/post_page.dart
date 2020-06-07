import 'package:desafio_framework/api/api.dart';
import 'package:desafio_framework/providers/sqlite_db_provider.dart';
import 'package:desafio_framework/shared/app_drawer.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key}) : super(key: key);
  static const String routeName = "/post";

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _buildPostListView(),
    );
  }

  @override
  void initState() {
    super.initState();
    // Chama o método _loadPostFromApi() quando o app inicializa
    _loadPostFromApi();
  }

  _loadPostFromApi() async {

    setState(() {
      isLoading = true;
    });

    var apiProvider = Api();
    await apiProvider.getAllPosts();

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _buildPostListView() {
    return FutureBuilder(
      future: SQLITEDBProvider.db.getAllPosts(),
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