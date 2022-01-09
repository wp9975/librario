import 'package:flutter/material.dart';
import 'package:librario/models/books.dart';
import 'package:librario/services/database.dart';
import 'package:provider/provider.dart';
import 'katalog.dart';

class edytuj extends StatefulWidget {
  @override
  _edytujState createState() => _edytujState();
}

class _edytujState extends State<edytuj> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>?>.value(
      value: DatabaseService().books_data,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edycja katalogu'),
          backgroundColor: Colors.brown,
        ),
        body: BookList(),
      ),
    );
  }
}
