import 'package:flutter/material.dart';
import 'package:librario/models/books.dart';
import 'pdf.dart';

class BookTile extends StatelessWidget {
  final Book? book;
  BookTile({this.book});
  static String pdfPath = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
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
          onTap: () {
            pdfPath = book!.pdfUrl;
            print(pdfPath);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pdf()),
            );
          },
        ),
      ),
    );
  }
}
