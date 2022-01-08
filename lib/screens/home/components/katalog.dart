import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:librario/models/books.dart';
import 'package:provider/provider.dart';
import 'package:librario/services/database.dart';

class catalog extends StatefulWidget {
  @override
  _catalogState createState() => _catalogState();
}

class _catalogState extends State<catalog> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().books_data,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Katalog'),
        ),
        body: BookList(),
      ),
    );
  }
}

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    final book_data = Provider.of<QuerySnapshot>(context);
    for (var docs in book_data.docs) {
      print(docs.data());
    }
    return Container();
  }
}
