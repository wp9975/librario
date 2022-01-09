import 'package:flutter/material.dart';
import 'package:librario/models/books.dart';
import 'package:provider/provider.dart';

class EditBookTile extends StatelessWidget {
  final Book? book;
  EditBookTile({this.book});
  static String pdfPath = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        color: Colors.brown[50],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: ClipRRect(
              child: Container(
            height: 200,
            width: 100,
            child: Image.network(book!.imgUrl),
          )),
          title: Text(book!.tytul),
          subtitle: Text(book!.autor),
          onTap: () {},
        ),
      ),
    );
  }
}

class EditBookList extends StatefulWidget {
  @override
  _EditBookListState createState() => _EditBookListState();
}

class _EditBookListState extends State<EditBookList> {
  @override
  Widget build(BuildContext context) {
    final book_data = Provider.of<List<Book>>(context);

    return ListView.builder(
      itemCount: book_data.length,
      itemBuilder: (context, index) {
        return EditBookTile(book: book_data[index]);
      },
    );
  }
}
