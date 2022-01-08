import 'package:flutter/material.dart';

class start extends StatelessWidget {
  static final String pdfUrl =
      'https://wolnelektury.pl/media/book/pdf/pan-tadeusz.pdf';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () async {
                Set(pdfUrl) =>
                    'https://wolnelektury.pl/katalog/lektura/chuda-o-niedzwiedziu-krolewiczu.html';
                print(pdfUrl);
              },
              child: Text(
                'O niedźwiedziu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),
        Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () async {
                String pdfUrl =
                    'https://wolnelektury.pl/media/book/pdf/pan-tadeusz.pdf';
                print(pdfUrl);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),
      ]),
    );
  }
}
