import 'package:desafio_framework/api/api.dart';
import 'package:desafio_framework/providers/sqlite_db_provider.dart';
import 'package:desafio_framework/shared/app_drawer.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key}) : super(key: key);
  static const String routeName = "/todo";

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _buildTodoListView(),
    );
  }

  @override
  void initState() {
    super.initState();
    // Chama o método _loadTodoFromApi() quando o app inicializa
    _loadTodoFromApi();
  }

  _loadTodoFromApi() async {

    setState(() {
      isLoading = true;
    });

    var apiProvider = Api();
    await apiProvider.getAllTodos();

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _buildTodoListView() {
    return FutureBuilder(
      future: SQLITEDBProvider.db.getAllTodos(),
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
                  "Título: ${snapshot.data[index].title}"
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