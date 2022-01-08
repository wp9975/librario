import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String? tytul;
  String? autor;
  String? pdfUrl;

  Book(
    this.tytul,
    this.autor,
    this.pdfUrl,
  );
}
