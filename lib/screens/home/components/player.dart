import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:librario/services/database.dart';

class newBook extends StatefulWidget {
  const newBook({Key? key}) : super(key: key);

  @override
  _newBookState createState() => _newBookState();
}

class _newBookState extends State<newBook> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference listBooks =
      FirebaseFirestore.instance.collection('books_data');
  String tytul = '';
  String autor = '';
  var pdfUrl = '';
  var imgUrl = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 30, bottom: 0),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Wpisz tytuł' : null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2)),
                labelText: 'Tytuł',
                hintText: 'Wpisz tytuł książki'),
            onChanged: (val) {
              setState(() => tytul = val);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          //padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Wpisz autora' : null,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2)),
                labelText: 'Autor',
                hintText: 'Wpisz autora'),
            onChanged: (val) {
              setState(() => autor = val);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 0),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Wpisz URL' : null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2)),
                labelText: 'URL do pliku pdf',
                hintText: 'Podaj adres URL do pliku PDF'),
            onChanged: (val) {
              setState(() => pdfUrl = val);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 30),
          //padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Wpisz URL' : null,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2)),
                labelText: 'URL Okładki',
                hintText: 'Wpisz adres URL do zdjęcia okładki'),
            onChanged: (val) {
              setState(() => imgUrl = val);
            },
          ),
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () async {
              print(pdfUrl);
              print(imgUrl.length);
              await listBooks.add({
                'tytul': tytul,
                'autor': autor,
                'pdfUrl': pdfUrl,
                'imgUrl': imgUrl,
              });
            },
            child: Text(
              'Dodaj PDF',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    )));
  }
}
